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
    // what is returned by SwiftUI is stored in dictonary as we do not know if it is going to return in the order of the elements added
    @State private var sizes: [Elements.Element.ID: CGSize] = [:]
       
    // result is basically a offsets (we care only about x since it is simplerowlayout)
    // this is for the id we get the offset in the form of CGSize only width is updated,height is not updated
    func layout() -> [Elements.Element.ID: CGSize] {
        var result: [Elements.Element.ID: CGSize] = [:]
        // running offset
        var offset = CGSize.zero
        // here we are looping with our own data so order is correct
        // but we are taking sizes from dictionary
        for element in data {
            result[element.id] = offset
            let size = sizes[element.id] ?? CGSize.zero
            offset.width += size.width + 10
        }
        
        return result
    }
    
    var body: some View {
        ZStack {
            ForEach(data) { string in
                PropagateView(content: self.content(string), id: string.id)
                    .offset(self.layout()[string.id] ?? .zero)
            }
        }.onPreferenceChange(CollectionViewSizeKey.self) { sizes in
            self.sizes = sizes
        }
        .background {
            Color.blue
        }
    }
}

struct PropagateView<V: View, ID: Hashable>: View {
    var content: V
    var id: ID
    
    var body: some View {
        self.content.background {
            GeometryReader { proxy in
                Color.clear
                    .preference(key: CollectionViewSizeKey.self, value: [id: proxy.size])
            }
        }
        .border(.black)
    }
}

extension String: @retroactive Identifiable {
    public var id: String { self }
}

struct CollectionViewSizeKey<ID: Hashable>: PreferenceKey {
    typealias Value = [ID: CGSize]
    
    static var defaultValue: [ID: CGSize] { [:] }
    
    static func reduce(value: inout [ID: CGSize], nextValue: () -> [ID: CGSize]) {
        value.merge(nextValue()) { $1 }
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
