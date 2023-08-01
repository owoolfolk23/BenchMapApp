//
//  Benchmap_appApp.swift
//  Benchmap app
//
//  Created by student on 7/6/23.
//

import SwiftUI

@main
struct Benchmap_appApp: App {
   @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
