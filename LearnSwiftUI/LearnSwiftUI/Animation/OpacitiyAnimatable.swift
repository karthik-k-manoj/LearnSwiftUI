//
//  OpacitiyAnimatable.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 06/08/24.
//

import SwiftUI

struct OpacitiyAnimatable: View {
    @State private var flag = false
    @State private var flag2 = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .modifier(MyOpacitiy(value: flag ? 0.3 : 1))
            .onTapGesture {
                flag.toggle()
                flag2.toggle()
            }
            .animation(.linear, value: flag2) // This value is only used to specify if an animation has to be done view subtree. It's changed from previous then
                                              // animation traverse through the sub tree to see if any `animatableData` has changed from render tree. If yes it is going to interpolate all the values
    }                                         // we have `animation(_:)` this was deprecated why? because it was always inspecting for `animatableData` change.
                                              // But now with the above modifier we only check if that value has changed.
                                              // Only when this value is changed `animatableData` is inspected else no
}

struct OpacitiyAnimatable_Previews: PreviewProvider {
    static var previews: some View {
        OpacitiyAnimatable()
    }
}

struct MyOpacitiy: ViewModifier, Animatable {
    var value: Double
    
    var animatableData: Double {
        get {
            value
        }
        
        // So SwiftUI is going to set this value which in directly sets the underlying opacity value
        set {
            value = newValue
        }
    }
    
    func body(content: Content) -> some View {
        let _ = print(animatableData)
        content
            .opacity(value)
    }
}
