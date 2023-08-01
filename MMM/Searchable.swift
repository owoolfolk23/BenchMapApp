//
//  Searchable.swift
//  MMM
//
//    Created by student on 7/25/23.


import SwiftUI

struct Searchable: View {
   @State var searchQuery: String

    var body: some View {

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




            Spacer()


        }
        .padding()

    }
}

struct Searchable_Previews: PreviewProvider {
    static var previews: some View {
        Searchable(searchQuery: " ")
    }


}
