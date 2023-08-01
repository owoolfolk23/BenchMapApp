//
//  BenchMapViewRepresentable.swift
//  Benchmap app
//
//  Created by student on 7/7/23.
//

import SwiftUI
import MapKit

struct BenchMapViewRepresentable: UIViewRepresentable {
    let mapView = MKMapView()
    let locationManager = LocationManager()
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var isPreview: Bool = false
    
    func makeUIView(context: Context) -> some UIView {
        mapView.addAnnotations(benchList)
        
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.8789, longitude: -87.6372), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)), animated: true)
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print([locationViewModel.selectedLocationCoordinate, context.coordinator.userLocationCoordinate])
        if let coordinate = locationViewModel.selectedLocationCoordinate {
            context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
            if let userLocation = context.coordinator.userLocationCoordinate {
                context.coordinator.getDestinationRoute(from: userLocation, to: coordinate)
            }
        }
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension BenchMapViewRepresentable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        
        //        MARK: - Properties
        
        let parent: BenchMapViewRepresentable
        
        var userLocationCoordinate: CLLocationCoordinate2D?
        
        //        MARK: - Lifecycle
        
        init(parent: BenchMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        // MARK: Overlay Renderer
        func mapView(_ mapvView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let polyline = MKPolylineRenderer(overlay: overlay)
            polyline.strokeColor = .systemBlue
            polyline.lineWidth = 3
            // dash 1 long, spaced by 3
            polyline.lineDashPattern = [1, 3]
            return polyline
        }
        
        //        MARK: - MKMapViewDelegate
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            parent.mapView.setRegion(region, animated: true)
        }
        
        // MARK: Annotation MapView
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? BenchCheckpoint else {
                return nil
            }
            // 3
            let identifier = "artwork"
            var view: MKMarkerAnnotationView
            // 4
            if let dequeuedView = mapView.dequeueReusableAnnotationView(
                withIdentifier: identifier) as? MKMarkerAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 5
                view = MKMarkerAnnotationView(
                    annotation: annotation,
                    reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            view.markerTintColor = UIColor(annotation.color)
            return view
        }
        
        
        //        MARK: - Helpers
        
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D) {
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parent.mapView.addAnnotation(anno)
            parent.mapView.selectAnnotation(anno, animated: true)
            
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
            
        }
        
        func getDestinationRoute(from userLocation: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
            let userPlacemark = MKPlacemark(coordinate: userLocation)
            let destPlacemark = MKPlacemark(coordinate: destination)
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: userPlacemark)
            request.destination = MKMapItem(placemark: destPlacemark)
            request.transportType = .walking
            let directions = MKDirections(request: request)
            
            directions.calculate { response, error in
                guard let response = response else {
                    if let error = error {
                        print("Error: \(error)")
                    }
                    return
                }
                
                let route = response.routes[0]
                self.parent.mapView.addOverlay(route.polyline, level: MKOverlayLevel.aboveRoads)
                
                var rect = route.polyline.boundingMapRect
                let wPad = rect.size.width * 0.25
                let hPad = rect.size.height * 0.25
                rect.size.width += wPad
                rect.size.height += hPad
                rect.origin.x -= wPad / 2
                rect.origin.y -= hPad / 2
                
                self.parent.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
    }
}

struct BenchMapViewRepresentable_Previews: PreviewProvider {
    @StateObject static var locationViewModel = LocationSearchViewModel()
    
     static var previews: some View {
         BenchMapViewRepresentable(isPreview: true)
             .environmentObject(locationViewModel)
             .ignoresSafeArea()
    }
}
