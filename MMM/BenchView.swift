//
//  BenchView.swift
//  MMM
//
//  Created by student on 7/25/23.
//

import SwiftUI

struct SwiftUIView: View {
    var distanceAway: String
    var bench: String
    var benchAddress: String
    
    var body: some View {
        
            VStack{
                Text(bench)
                    .padding()
                    .font(.title)
                
                
                HStack {
                    Text("\(distanceAway) mi")
                        .padding()
                    
                    Spacer()
                    
                    Text(benchAddress)
                        .padding()
                }
                }
        
        
                
            
                
            
        .background(.green)
        .cornerRadius(20)
        .padding()
            
        }
        
    }

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(distanceAway: "0.2", bench: "Bench park" , benchAddress: "123 S Street" )
    }
}

