//
//  DisableAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 18/08/24.
//

import SwiftUI

struct DisableAnimation: View {
    @State var position: CGFloat = 40
       var body: some View {
           VStack {
               Text("Hi")
                   .offset(x: position, y: position)
                   .animation(.easeInOut, value: position)

               Slider(value: $position, in: 0...150)
               Button("Animate") {
                   var transaction = Transaction() // If the timeline curve function is not specified, the original setting will be retained (in this case, easeInOut).
                   transaction.animation = .linear
                   if position < 100 { transaction.disablesAnimations = true }
                   withTransaction(transaction) { // withTransaction can disable the timeline curve function of the original transaction (associated with the animation), but cannot shield the timeline curve function associated with the transaction.
                       position = 0
                   }
               }
           }
           .frame(width: 400, height: 500)
       }
}

#Preview {
    DisableAnimation()
}
