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
        /*
         HStack or VStack will propose 3 times to each. 2 times by proposing 0 and inf to get their flexibility
         if all views fleixibilty is defined then HStack can propose the remaining width / number of views to each
         view in the order from least flexibile to most flexible. So fixed frame is least flexibile. When HStack
         looks at it's child, a child may be a view with a child or a leaf view. It doesn't matter what the nested view
         structure it is. What the outer view reports the size that will be the size considered by the HStack.
         HStack will say I am proposing you X and this is passed on to every layer in the view to get the outer most view's size
         */
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
