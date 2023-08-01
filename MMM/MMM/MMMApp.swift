//
//  MMMApp.swift
//  MMM
//
//  Created by student on 7/25/23.
//

import SwiftUI

@main
struct MMMApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(searchQuery: " ", distanceAway: "0.2", bench: "Bench park" , benchAddress: "123 S Street")
        }
    }
}
