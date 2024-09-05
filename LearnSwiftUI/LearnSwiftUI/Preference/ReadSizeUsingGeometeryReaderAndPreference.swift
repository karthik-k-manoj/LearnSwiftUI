//
//  ReadSizeUsingGeometeryReaderAndPreference.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 05/09/24.
//

import SwiftUI

struct SizePreference: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        
    }
}

struct ReadSizeUsingGeometeryReaderAndPreference: View {
    @ViewBuilder var childView: some View {
        Rectangle()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
    
    var body: some View {
        childView
            .readSize { newSize in
                print("The new child size is \(newSize)")
            }
    }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background {
            GeometryReader(content: { geometry in
                Color.clear
                    .preference(key: SizePreference.self, value: geometry.size)
            })
        }
        .onPreferenceChange(SizePreference.self, perform: onChange)
    }
}

#Preview {
    ReadSizeUsingGeometeryReaderAndPreference()
}
