//
//  CollectionViewFlowLayoutUsingPreference.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 27/09/24.
//

import SwiftUI

// result is basically a offsets (we care only about x since it is simplerowlayout)
// this is for the id we get the offset in the form of CGSize only width is updated,height is not updated
func singleLineLayout<Elements>(for elements: Elements, containerSize: CGSize, sizes: [Elements.Element.ID: CGSize]) -> [Elements.Element.ID: CGSize] where Elements: RandomAccessCollection, Elements.Element: Identifiable {
    var result: [Elements.Element.ID: CGSize] = [:]
    // running offset
    var offset = CGSize.zero
    // here we are looping with our own data so order is correct
    // but we are taking sizes from dictionary
    for element in elements {
        result[element.id] = offset
        let size = sizes[element.id] ?? CGSize.zero
        offset.width += size.width + 10
    }
    
    return result
}

func flowLayout<Elements>(for elements: Elements, containerSize: CGSize, sizes: [Elements.Element.ID: CGSize]) -> [Elements.Element.ID: CGSize] where Elements: RandomAccessCollection, Elements.Element: Identifiable  { // offset
    var current: CGPoint = .zero
    var lineheight: CGFloat = 0
    let offset: UIOffset = UIOffset(horizontal: 10, vertical: 10)
    
    var result: [Elements.Element.ID: CGSize] = [:]
    
    for element in elements {
        if (current.x + (sizes[element.id] ?? .zero).width) > containerSize.width {
            current.x = 0
            current.y += lineheight + offset.vertical
            lineheight = 0
        }
        
        lineheight = max(lineheight, (sizes[element.id] ?? .zero).height)
        result[element.id] = CGSize(width: current.x, height: current.y)
        
        current.x += (sizes[element.id] ?? .zero).width + offset.horizontal
    }
    
    return result
}


struct CollectionView<Elements, Content>: View where Elements: RandomAccessCollection, Content: View, Elements.Element: Identifiable {
    var data: Elements
    // what is returned by SwiftUI  is stored in dictonary as we do not know if it is going to return in the order of the elements added
    var layout: (Elements, CGSize, [Elements.Element.ID: CGSize]) -> [Elements.Element.ID: CGSize]
    var content: (Elements.Element) -> Content
    @State private var sizes: [Elements.Element.ID: CGSize] = [:]
    // translation is relative to start point and location is relative to super view (in super view)
    @State private var dragState: ((id:Elements.Element.ID, translation: CGSize))?
    var body: some View {
        GeometryReader { proxy in
            self.bodyHelper(containerSize: proxy.size, offsets: self.layout(self.data, proxy.size, self.sizes))
        }
    }
     
    private func bodyHelper(containerSize: CGSize, offsets: [Elements.Element.ID: CGSize]) -> some View {
        ZStack(alignment: .topLeading) {
            ForEach( data) { string in
                PropagateView(content: self.content(string), id: string.id)
                    .offset(offsets[string.id] ?? .zero)
                    .offset(self.dragState?.id == string.id ? self.dragState!.translation : .zero)
                    .gesture(DragGesture().onChanged({ value in
                        dragState = (string.id, value.translation)
                    }).onEnded({ _ in
                        withAnimation {
                            dragState = nil
                        }
                    }))
            }
            Color.clear
                .frame(width: containerSize.width, height: containerSize.height)
                .fixedSize()
        }.onPreferenceChange(CollectionViewSizeKey.self) { sizes in
            withAnimation {
                self.sizes = sizes
            }
        }
        .background(Color.red)
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
    
    @State var dividerWidth: CGFloat = 100
    
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: dividerWidth)
                CollectionView(data: strings, layout: flowLayout) { string in
                    Text(string)
                        .padding(10)
                        .background {
                            Color.gray
                        }
                }
            }
            
            Slider(value: $dividerWidth, in: 0...500)
        }
    }
}

#Preview {
    CollectionViewFlowLayoutUsingPreference()
}
