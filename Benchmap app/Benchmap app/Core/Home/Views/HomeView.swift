//
//  HomeView.swift
//  Benchmap app
//
//  Created by student on 7/7/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showLocationSearchView = false
    var body: some View {
        ZStack(alignment: .top) {
            BenchMapViewRepresentable()
                .ignoresSafeArea()
           
//           search button
            if showLocationSearchView {
                LocationSearchView(showLocationSearchView: $showLocationSearchView)
            } else {
                LocationSearchActivationView()
                    .padding(.top, 72)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showLocationSearchView.toggle()
                        }
                    }
            }
            
            MapViewActionButton(showLocationSearchView: $showLocationSearchView)
                .padding(.leading)
                .padding(.top, 4)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @StateObject static var locationViewModel = LocationSearchViewModel()
    
     static var previews: some View {
        HomeView()
             .environmentObject(locationViewModel)
    }
}

