//
//  AnimatableWithSpecificDependency.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 18/08/24.
//

import SwiftUI

struct AnimatableWithSpecificDependency: View {
    @State var x: CGFloat = 0
    @State var y: CGFloat = 0
    @State var isRed = false
    
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .fill(isRed ? .red : .orange)
                .frame(width: 30, height: 30)
                .offset(x: x, y: y)
                .animation(.spring, value: isRed)
                .animation(.linear, value: y)
            Spacer()
            Button("Animate") {
                if x == 0 {
                    x = 100
                } else {
                    x = 0
                }
                
                if y == 0 { y = 100 } else {
                    y = 0
                }
                
                isRed.toggle()
            }
        }
        .frame(width: 500, height: 500)
    }
}
/*
 Currently animation<V>(_ animation: Animation?, value: V) does not support associating different time curve function with different dependencies of the same animatable component. It works well for different dependency of different animaatble component"
 */
#Preview {
    AnimatableWithSpecificDependency()
}
