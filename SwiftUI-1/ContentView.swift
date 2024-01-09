//
//  ContentView.swift
//  SwiftUI-1
//
//  Created by Karthik K Manoj on 09/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(uiImage: .add)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
            VStack(alignment: .leading) {
                Text("Asynchronous Programming With SwiftUI and Combine")
                    .font(.headline)
                Text("by Peter Friese")
                    .font(.subheadline)
                Text("451 pages")
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
