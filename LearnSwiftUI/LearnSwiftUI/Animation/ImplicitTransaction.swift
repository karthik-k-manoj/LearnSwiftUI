//
//  ImplicitTransaction.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 06/08/24.
//

import SwiftUI

struct ImplicitTransaction: View {
    // this is to let transaction type to inform animation is requried for any changes in animatableDate within in view subtree
    @State private var mutateWidth = false
    
    @State private var animateFlag = false
    
    // What can make the `animatableData` with respec to render tree, it's by changing the flag. Who can do it?
    // let's say a button can do that. So here a button can change the state of a view and cause to re execute body
    // but if using a value parameter animation API then only if the value parameter changes the animation will take place
    
    var body: some View {
        Rectangle()
            .frame(width: mutateWidth ? 100 : 50, height: 50)
            .transaction { t in
                t.animation = .default
            }
            .onTapGesture {
                mutateWidth.toggle()
            }
    }
}

struct ImplicitTransaction_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitTransaction()
    }
}
