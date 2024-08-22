//
//  ExplicitIdentifierAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 22/08/24.
//

import SwiftUI

struct Item: Identifiable, Equatable {
    let id = UUID() // unique identifier
    let number: Int
}


struct ExplicitIdentifierAnimation: View {
    @State private var items = (0...100).map { Item(number: $0) }
    
    var body: some View {
        VStack {
            List {
                ForEach(items, id: \.id) { item in
                    Text("\(item.number)")
                }
            }
        }
        .animation(.easeIn(duration: 2), value: items)
        Button("Remove second") {
            items.remove(at: 1)
        }
        
        // if duplicate elements are added to list then it causes issues so we need to identify them
        
        Button("Add second") {
            items.insert(Item(number: Int.random(in: 0...100)), at: 1)
        }
    }
}

#Preview {
    ExplicitIdentifierAnimation()
}
