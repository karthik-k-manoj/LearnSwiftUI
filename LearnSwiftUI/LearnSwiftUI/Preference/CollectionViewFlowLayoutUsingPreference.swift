//
//  CollectionViewFlowLayoutUsingPreference.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 27/09/24.
//

import SwiftUI

struct CollectionView<Elements, Content>: View where Elements: RandomAccessCollection, Content: View, Elements.Element: Identifiable {
    var data: Elements
    var content: (Elements.Element) -> Content
    
    var body: some View {
        HStack {
            ForEach(data) { string in
                self.content(string)
            }
        }
    }
}

extension String: @retroactive Identifiable {
    public var id: String { self }
}

struct CollectionViewFlowLayoutUsingPreference: View {
    var strings = (1...10).map {
        "Item \($0)" + String(repeatElement("x", count: Int.random(in: 0...10)))
    }
    
    var body: some View {
        CollectionView(data: strings) { string in
            Text(string)
                .padding(10)
                .background {
                    Color.red
                }
        }
    }
}

#Preview {
    CollectionViewFlowLayoutUsingPreference()
}
