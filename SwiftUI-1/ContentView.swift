//
//  ContentView.swift
//  SwiftUI-1
//
//  Created by Karthik K Manoj on 09/01/24.
//

import SwiftUI

struct ContentView: View {
    var books: [Book]
    
    var body: some View {
        List(books) { book in
            HStack(alignment: .top) {
                Image(uiImage: .add)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    Text(book.author)
                        .font(.subheadline)
                    Text(book.isbn)
                        .font(.subheadline)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(books: Book.sampleBooks)
    }
}
