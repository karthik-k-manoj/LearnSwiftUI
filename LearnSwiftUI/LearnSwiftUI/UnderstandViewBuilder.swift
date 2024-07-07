//
//  UnderstandViewBuilder.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 06/07/24.
//

import SwiftUI

struct UnderstandViewBuilder: View {
    var highlighted = true
    var body: some View {
        // This pattern introduces a branch in view that might have unforeseen consequences. Instead use modifiers directly as almost every modifiers take optionals to specify a value
        // or nil if don't want to a value. For e.g. width and height of a frame are optionals, color of foregroundColor is optional and length of padding is optional
        // For the same reason, view modifiers like bold or disabled take a Boolean argument, although one might naively think that the argument isn’t necessary.
        Text("Hello World")
            .applyIf(true) {
                $0.background(Color.red)
            }
            .type()
        
        Text("Hello World")
            .background(highlighted ? .red : .clear)
            .type()
        
        Text("Hello World")
            .bold(highlighted ? true : false)
            .type()
        
        Text("Hello World")
            .foregroundStyle(Color.red)
            .type()
    }
}

struct UnderstandViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        UnderstandViewBuilder()
    }
}

// Anti-pattern
extension View {
    /*
     View builders are actually result builders which have certain static methods such as `buildBlock`, `buildExpression`, `buildIf` `buildEither` implemented by apple to create
     views such as here `applyIf` is a result builder function that gets translated using `buildEither` type method to get `ConditionalContent` view.
     */
    @ViewBuilder
    func applyIf<V: View>(_ condition: Bool, transform: (Self) -> V) -> some View {
        if condition {
            transform(self)
        } else{
            self
        }
    }
}

