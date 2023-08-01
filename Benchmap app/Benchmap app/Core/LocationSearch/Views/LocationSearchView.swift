//
//  LocationSearchView.swift
//  Benchmap app
//
//  Created by student on 7/14/23.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var showLocationSearchView: Bool
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        
        //        header view
        VStack {
            VStack {
                TextField("Current Location", text: $startLocationText)
                    .frame(height: 32)
                    .background(Color(.systemGroupedBackground))
                    .padding(.trailing)
                
                TextField("Where to?", text: $viewModel.queryFragment )
                    .frame(height: 32)
                    .background(Color(.systemGray4))
                    .padding(.trailing)
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            //        list view
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results , id: \.self) { result in
                        
                        LocationSearchResultCell (title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                viewModel.selectLocation(result)
                                showLocationSearchView.toggle()
                                
                            }
                    }
                }
                
            }
            
        }
        .background(Color.theme.backgroundColor)
        .background(.white)
    }
    
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(showLocationSearchView: .constant(false))
    }
}
