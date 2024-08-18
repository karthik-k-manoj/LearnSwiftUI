//
//  AnimationWithoutValue.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 18/08/24.
//

import SwiftUI

struct AnimationWithoutValue: View {
    @State var red = false
    @State var x: CGFloat = 0
    
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .fill(red ? .red : .blue)
                .frame(width: 30, height: 30)
                .offset(x: x)
                .animation(.easeInOut(duration: 1)) // associates both x and red dependencies
                // .animation(.easeInOut(duration: 1), value: x) // recommended to use separate associations
                // .animation(.easeInOut(duration: 1), value: red)
            
            // when modifying multiple dependencies at once, `animation(_ animation: Animation?) is prone to unnecessary animations, whic his main reason it has been deprecated
            Spacer()
            Button("Animate") {
                if x == 0 {
                    x = 100
                } else {
                    x = 0
                }
                
                red.toggle()
            }
        }
        .frame(width: 500, height: 300)
        .border(.red)
    }
}

#Preview {
    AnimationWithoutValue()
}
