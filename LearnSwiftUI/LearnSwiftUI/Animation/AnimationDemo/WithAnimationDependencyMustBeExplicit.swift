//
//  WithAnimationDependencyMustBeExplicit.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 18/08/24.
//

import SwiftUI

/*
 Note that when using withAnimation, the dependencies must be explicitly included in the closure otherwise `withAnimation` will not work.
 
 Although `withAnimation` is used in the Array extension method
 `appendWithAnimation`, the SwiftUI animation mechanism is not activated because the closure of `withAnimation` does not include specific dependencies
 */
struct WithAnimationDependencyMustBeExplicit: View {
    @State var items = [0,1,2,3]
    
    var body: some View {
        VStack {
            Button("In withAnimation") {
                withAnimation(.easeInOut) {
                    items.append(Int.random(in: 0...1000))
                }
            }
            
            Button("Not in withAnimation") {
                items.appendWithAnimation(Int.random(in: 0...1000), .easeInOut)
            }
            
            List {
                ForEach(items, id: \.self) { item in
                    Text("\(item)")
                }
            }
        }
        .frame(width: 500, height: 500)
    }
}

extension Array {
    mutating func appendWithAnimation(_ newElement: Element, _ animation: Animation?) {
        withAnimation(animation) {
            append(newElement)
        }
    }
}

#Preview {
    WithAnimationDependencyMustBeExplicit()
}
