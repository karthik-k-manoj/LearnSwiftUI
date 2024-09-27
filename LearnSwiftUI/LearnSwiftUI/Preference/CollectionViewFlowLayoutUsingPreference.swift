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
                PropagateView(content: self.content(string))
            }
        }.onPreferenceChange(CollectionViewSizeKey.self) { sizes in
            print(sizes)
        }
    }
}

struct PropagateView<V: View>: View {
    var content: V
    
    var body: some View {
        GeometryReader { proxy in
            self.content
                .preference(key: CollectionViewSizeKey.self, value: [proxy.size])
        }
        .border(.black)
    }
}

extension String: @retroactive Identifiable {
    public var id: String { self }
}

struct CollectionViewSizeKey: PreferenceKey {
    typealias Value = [CGSize]
    
    static var defaultValue: [CGSize] = []
    
    static func reduce(value: inout [CGSize], nextValue: () -> [CGSize]) {
        value.append(contentsOf: nextValue())
    }
    
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
