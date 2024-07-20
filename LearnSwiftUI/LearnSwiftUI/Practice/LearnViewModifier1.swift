//
//  LearnViewModifier1.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 15/07/24.
//

import SwiftUI

struct LearnViewModifier1: View {
    var body: some View {
        Text("Hello World")
            .modifier(BorderCaption())
    }
}

struct LearnViewModifier1_Previews: PreviewProvider {
    static var previews: some View {
        LearnViewModifier1()
    }
}

struct BorderCaption: ViewModifier {
    // this is kind of `var body: some View`
    // this is method since we need to get the view onto which modification is applied
    func body(content: Content) -> some View {
        content // this content will be provided a propsoed size minus 10 on all sides.
            .fixedSize()
            .border(Color.red) // we proposed  a size (100 - 10, 100 - 100) to child `fixedSize`
                                // but it responsed with a different size (since it ask it's child for ideal size)
            .font(.caption2)
            .padding(10) // this has changed the layout. What is proposed is being modified here
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            }
            .foregroundColor(Color.blue)
    }
    // This view modifier type has just the same view tree when expanded to the view being applied
}

extension View {
    // This is a custom one. We need to know the behaviour.
    func borderedCaption() -> some View {
        // `BorderCaption` is the view returned after wrapping `self` by calling
        // `modifier()`
        modifier(BorderCaption())
    }
}
