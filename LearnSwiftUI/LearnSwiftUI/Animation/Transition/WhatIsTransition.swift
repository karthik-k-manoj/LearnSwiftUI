//
//  WhatIsTransition.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 21/08/24.
//

import SwiftUI
/*
 The transition type (AnyTransition) in swiftUu is a repacking of animatable components
 when the change of a state causes a change in the branch of the view tree SU will use it's
 wrapped animatable components to animate the view
 
 By setting disablesAnimaation, the original timing curve function (which cannot be changed) in the transaction can be disabled.
 
 Using transitions also requires satisfying the three elements of SwiftUI animation
 
 Transaction has 2 states. active state and identity state. When a view is inserted it animates from active state to identity of the trantion . When it's removed it animates from identity state to active state. For the opacity transition, the acvtive state applies an opacity(0) modifier and identity state applies an opacity(1)
*/
struct WhatIsTransition: View {
    @State var show = true
    
    var body: some View {
        VStack {
            Spacer()
            Text("hello")
            if show {
                Text("World")
                    .transition(.opacity)
            }
            Spacer()
            Button(show ? "Hide" : "Show") {
                show.toggle()
            }
        }
        .animation(.easeInOut(duration: 5), value: show) // create dependency association and set timing curve
        .frame(width: 300, height: 300)
    }
}

#Preview {
    WhatIsTransition()
}
