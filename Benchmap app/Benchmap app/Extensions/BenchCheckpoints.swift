//
//  BenchCheckpoints.swift
//  Benchmap app
//
//  Created by student on 7/31/23.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

enum BenchType: String {
    case Park
    case CTA
}

class BenchCheckpoint: NSObject, MKAnnotation {
    let title: String?
    let type: BenchType
    let coordinate: CLLocationCoordinate2D
    
    init(type: BenchType, coordinate: CLLocationCoordinate2D) {
        self.type = type
        self.title = type.rawValue
        self.coordinate = coordinate
    }
    
    var subtitle: String? {
        title
    }

    var color: Color {
        switch type {
        case .Park:
            return .green
        case .CTA:
            return .blue
        }
    }
}

var benchList : [BenchCheckpoint] = [
    BenchCheckpoint(type: .Park, coordinate: CLLocationCoordinate2D(latitude: 41.884017752095, longitude: -87.6233594560897)),
    BenchCheckpoint(type: .Park, coordinate: CLLocationCoordinate2D(latitude: 41.8838979380617, longitude: -87.6233675027162)),
    BenchCheckpoint(type: .Park, coordinate: CLLocationCoordinate2D(latitude: 41.8838320402476, longitude: -87.6233675027162)),
    BenchCheckpoint(type: .Park, coordinate: CLLocationCoordinate2D(latitude: 41.8826797795156, longitude: -87.6229943048767)),
    BenchCheckpoint(type: .Park, coordinate: CLLocationCoordinate2D(latitude: 41.8836237849231, longitude: -87.6218842280927)),
    BenchCheckpoint(type: .Park, coordinate: CLLocationCoordinate2D(latitude: 41.8817271423025, longitude: -87.6236417187784)),
    BenchCheckpoint(type: .Park, coordinate: CLLocationCoordinate2D(latitude: 41.8812508307648, longitude: -87.6236305278117)),
    BenchCheckpoint(type: .CTA, coordinate: CLLocationCoordinate2D(latitude: 41.8845789575478, longitude: -87.6221339494663)),
    BenchCheckpoint(type: .CTA, coordinate: CLLocationCoordinate2D(latitude: 41.8843053424279, longitude: -87.6238266561611)),
    BenchCheckpoint(type: .CTA, coordinate: CLLocationCoordinate2D(latitude: 41.8842366720488, longitude: -87.6208896563253)),
    BenchCheckpoint(type: .CTA, coordinate: CLLocationCoordinate2D(latitude: 41.8803897099827, longitude: -87.624204934402)),
    BenchCheckpoint(type: .CTA, coordinate: CLLocationCoordinate2D(latitude: 41.8824202781252, longitude: -87.6240987243856)),
]
