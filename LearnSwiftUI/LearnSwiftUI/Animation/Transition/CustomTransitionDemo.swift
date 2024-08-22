//
//  CustomTransitionDemo.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 22/08/24.
//

import SwiftUI

struct MyTransition: ViewModifier {
    let rotation: Angle
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(rotation) // animatable component
    }
}

struct CustomTransitionDemo: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CustomTransitionDemo()
}
