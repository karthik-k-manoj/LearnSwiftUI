//
//  SetTimingCurveFunction2.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 21/08/24.
//

import SwiftUI

enum Status {
    case one
    case two
    case three
}
struct SetTimingCurveFunction2: View {
    @State private var isRed: Bool = false
    @State private var status: Status = .one
    
    /*
     Unfortunately, at the time of writing, there are some exceptions to the rule that .animation(_:value:) only animates changes in its subtree. For example, if we switch the .frame and .animation lines in the example above, the frame will still animate. In our understanding, this is intended behavior. Ole Begemann describes these exceptions nicely in his blog post.
     https://oleb.net/2022/animation-modifier-position/
     */
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isRed ? .red : .yellow)
                .transaction { transaction in
                    transaction.animation = .spring
                }
                .padding(status == .one ? 10.0 : 50)
                .border(.black)
                // here the border is an overlay which renders the child
                // and then renders the shape of the child. hence we are able to animate it
            
                // for offset the change is animated as a group
                // that is we want to translate to a position and then render so animation is considered as group and the closet transaction is picked up to animate it
                .transaction { transaction in
                   // transaction.disablesAnimations = true
                    switch status {
                    case .one:
                        transaction.animation = .linear(duration: 4.0)
                    case .two:
                        transaction.animation = .easeInOut(duration: 4)
                    case .three:
                        transaction.animation = nil
                    }
                }
                
            Button("Method 2: Animate") {
                isRed.toggle()
                status = status == .two ? .one : .two
            }
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SetTimingCurveFunction2()
}
