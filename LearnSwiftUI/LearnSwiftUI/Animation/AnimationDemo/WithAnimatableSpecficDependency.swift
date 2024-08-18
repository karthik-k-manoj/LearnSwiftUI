//
//  WithAnimatableSpecficDependency.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 18/08/24.
//

import SwiftUI

struct WithAnimatableSpecficDependency: View {
    @State var x: CGFloat = 0
    @State var y: CGFloat = 0
    
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .fill(.orange)
                .frame(width: 30, height: 30)
                .offset(x: x, y: y)
            Spacer()
            Button("Animate") {
                withAnimation(.linear) {
                    if x == 0 {
                        x = 100
                    } else {
                        x = 0
                    }
                }
                
                withAnimation(.easeInOut) {
                    if y == 0 { y = 100 } else {
                        y = 0
                    }
                }
            }
        }
        .frame(width: 500, height: 500)
    }
}

/*
 In addition to associating different types of timing curve function, SwiftUI also allow associating timing curve functions with different durations.
 When different dependencies of the same animatable ocmponents are associated with functions of different duration (or repeatFOrever eneabled) the interpolation calculation logic will become more complex and different combination will have different result. Use with caution
 */
#Preview {
    WithAnimatableSpecficDependency()
}
