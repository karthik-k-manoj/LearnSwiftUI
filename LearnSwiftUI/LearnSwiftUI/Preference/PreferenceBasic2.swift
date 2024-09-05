//
//  PreferenceBasic2.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 05/09/24.
//

import SwiftUI

struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        print("value", value)
        print("next value", nextValue())
        value = max(value, nextValue())
    }
}

struct ChildView: View {
    let height: CGFloat
    
    var body: some View {
        Color.blue
            .frame(height: height)
            .preference(key: HeightPreferenceKey.self, value: height)
    }
}

struct PreferenceBasic2: View {
    @State private var maxHeight: CGFloat = 0
    
    var body: some View {
        VStack {
            ChildView(height: 100)
            ChildView(height: 150)
            ChildView(height: 200)
            
            Text("Max Height: \(maxHeight)")
        }
        .onPreferenceChange(HeightPreferenceKey.self, perform: { value in
            maxHeight = value
        })
    }
}

#Preview {
    PreferenceBasic2()
}
