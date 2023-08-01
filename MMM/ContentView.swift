//
//  ContentView.swift
//  MMM
//
//  Created by student on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchQuery: String
    @State private var showingOptions = false
    
    var distanceAway: String
    var bench: String
    var benchAddress: String
    
    var body: some View {
         
        Button(action: {showingOptions.toggle()
            
        }){
            Image(systemName: "magnifyingglass.circle.fill")
                               .resizable()
                               .frame(width: 30, height: 30)
                               .foregroundColor(.green)
        }
        .sheet(isPresented: $showingOptions) {
            
            ScrollView{
                
                VStack {
                    TextField("Enter your Destination", text: $searchQuery)
                        .border(.gray, width: 4)
                        .cornerRadius(15)
                        .padding()
                    
                    Divider()
                    
                    Text("Nearby")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                        .padding()
                    
                    SwiftUIView(distanceAway: "0.2", bench: "CTA", benchAddress: "Loop")
                    
                    SwiftUIView(distanceAway: "0.4", bench: "Park", benchAddress: "Loop")
                    
                    SwiftUIView(distanceAway: "0.8" , bench: "Park", benchAddress: "Loop")
                    
                    SwiftUIView(distanceAway: "1.4", bench: "CTA", benchAddress: "Loop")
                    
                    SwiftUIView(distanceAway: "2.0", bench: "CTA", benchAddress: "Loop")
                    
                    SwiftUIView(distanceAway: "2.6", bench: "Park", benchAddress: "Hyde Park")
                    
                        .background(.green)
                        .cornerRadius(20)
                        .padding()
                    Spacer()
                }
                .padding()
            }
        }
        
        .presentationDetents([.medium, .large])
    }
    

    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(searchQuery: " ", distanceAway: "0.2", bench: "Bench park" , benchAddress: "123 S Street")
        }
    }
    
}
