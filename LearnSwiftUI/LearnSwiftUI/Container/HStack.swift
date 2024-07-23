//
//  HStack.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 22/07/24.
//

import SwiftUI

// Think about sizes. When you add a view to a another view you are basically creating another layer
// think if you do not have a view modifier then leaf view will be the only one.
// there are views that affect the layout such as fixed frame, flexible frame, aspect ratio, overlay, background
// fixed size. They all take a proposal from parent and will be asked to give their size, obviosuly they have a child
// also they can have some properties that influence their size if to consider child size or not.
// we need to understand each custom view to know how they influence their child and in turn influence their size
// if properites are not set then they just take child size as their own size


struct HStack_: View {
    var body: some View {
        HStack {
            Color.cyan
                .debugLog("Color Cyan")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .fixedSize()
                .debugLog("Fixed Size")
            Color.teal
                .debugLog("Color Teal")
        }
        .frame(width: nil, height: 200)
        .fixedSize()
        .border(Color.red)
    }
}

struct HStack__Previews: PreviewProvider {
    static var previews: some View {
        HStack_()
    }
}
