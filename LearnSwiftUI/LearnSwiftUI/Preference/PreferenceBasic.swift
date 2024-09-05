//
//  PreferenceBasic.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 05/09/24.
//

import SwiftUI

struct SizeKey: PreferenceKey {
    static var defaultValue: [CGSize] = []
    
    static func reduce(value: inout [CGSize], nextValue: () -> [CGSize]) {
        value.append(contentsOf: nextValue())
    }
}

extension View {
    func measureSize() -> some View {
        overlay {
            GeometryReader(content: { geometry in
                Color.clear
                    .preference(key: SizeKey.self, value: [geometry.size])
            })
        }
    }
}

struct PreferenceBasic: View {
    var body: some View {
        ZStack(alignment: .topLeading, content: {
            ForEach(0..<5) { idx in
                Text("Item \(idx)" + String(repeating: "\n", count: idx/2))
                    .padding()
                    .measureSize()
            }
        })
        .onPreferenceChange(SizeKey.self, perform: { value in
            print("ONCE")
            print(value)
        })
    }
}

#Preview {
    PreferenceBasic()
}

