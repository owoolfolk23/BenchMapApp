//
//  MapTabTrial.swift
//  Benchmap app
//
//  Created by student on 7/29/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.33182, longitude: -122.03118), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
   
    var body: some View {
        ZStack {
            // Tab View (Main Screen at the back)
            TabView {
                // Add your tabs here
                // For example:
                Text("Tab 1")
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("Tab 1")
                    }
               
                Text("Tab 2")
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Tab 2")
                    }
            }
           
            Map(coordinateRegion: $region, interactionModes: [.all], showsUserLocation: true)
                .ignoresSafeArea()
                .frame(height: UIScreen.main.bounds.height * 0.75) // Adjust the height as needed
                .cornerRadius(50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
