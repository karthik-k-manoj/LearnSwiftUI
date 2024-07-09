//
//  WhatIsAView.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 08/07/24.
//

import SwiftUI

/*
 
 A view is a value type. Why? Because it is of `struct`. Unlike in UIKit/AppKit where a view is of class type.
 
 Ever wondered why SwiftUI views are struct?
 
 1) As we know structs are simpler and faster to create than classes
 2) Normally a UIView or UIView subtype holds hundreds of properties. That's how inheritance works.
    SwiftUI views just hold data to represent that single view. It doesn't care about it's parent properties like classes
 3) If it was class then a constant class can mutate it's state and SwiftUI wouldn't be able to know when a value change
    in order to update th UI. Structs are immutable type and it uses other state management techniques to let the view update
 4) For example `Color.red` is simple type that descirbes it's space with red. That's it.
 5) It favors composition over inheritance pattern. Each view has single responsibility and it converts data into view,
    it can be easily composed to create bigger types.
 
 */

/*
 A swiftUI view is made of view trees. The views what we see are created and destoryed many times during the
 application run. So it is imperative to understand the view code we write has limited lifetime.
 Once a view tree is created it is backed up by a render tree (the persistent object) which is rendered on screen.
 Apple calls it attributed graph. Let's call them nodes in the render tree. They have a specific lifetime from the time
 when they are first rendered to when they are no longer needed for display. The mapping of view tree to render tree is all
 managed by SwiftUI internally.
 
 Keep in mind lifetime of a node in a render tree is not the same as visibility. We can have n nodes in the render tree
 but only (n - 5) views displayed on screen. For example, VStack has 10 views and is placed in a scroll view
 but scroll view shows only 5 items. Bottom line is nodes in the render tree have a lifetime but it's not in our control
 */

/*
 We need to understand when by any means a new view tree is created it has to be reflected into the render tree.
 View tree will always be in sync with the render tree. We do not need to worry about this. It is taken care by SwiftUI
 
Because a view tree shows the current state of the view and it has to be reflected into the render tree so
that user can see the view on screen
 */

/*
Let's talk about identity. Since views are struct it needs to be identified somehow so that SwiftUI can identify them
If it was a class then they have an intrinsic identity (reference). View can have two type of identity:
1) Implicity identity:  position of the view in the view tree.
2) Explicity Identity:  we give an explicit identity using `ForEach` construct or `id` modifier.
*/

struct WhatIsAView: View {
    var greeting: String?
    var isHighlighted: Bool = true
    
    var body: some View {
        // 0
        Text("Hello World")
        if let g = greeting {
            // 1.ifBranch
            Text(g)
        } else {
            // 1.elseBranch
            Text("Hello")
        }
        
        List {
            ForEach([1,2,3,4], id: \.self) { item in
                // `\.self` is a key path and refers to each element in the collection. Element needs to be hashable for this to work
                // There will be 4 text views on screen each identified by elements of the array.
                Text("Item is \(item)")
            }
        }
        
        // Another way to provide explicit identifier.
        Text("Explicit Identifer using id modifier")
            .id("1")
        
        // Here the id parameter can be `true` or `false. When this changes SwiftUI considers the view to be changed.
        // Depening on the condition we get two different views even though their cotent are the same. The parameter should be hashable
        Text("Explicit Identifer using id modifier")
            .id(greeting == nil)
        
        // Explicit identity does not override implicit identity. It is applied on top of it.
        // This means SwiftUI won't be confused with two views having the same explicit identifier.
        HStack {
            // IDView gets implicit identity as 0
            Text("Implicit identifier and explicit identifier")
            // Text gets explicit identity as true and an implict identity as 0.true
                .id(greeting == nil)
        }
        
        // Another example of identity. Even though v is defined as `Text` once but it is used
        // in two places giving it implicity identity of 0 and 1
        HStack {
            let v = Text("Hello")
            v
            v
        }
        
        // Another example related to view identity.
        HStack {
            Image(systemName: "hand.wave")
            Text("Hello")
                ._applyIf(isHighlighted) {
                    $0.background(.yellow)
                }
        }
    }
}

// This is an anti-pattern
extension View {
    @ViewBuilder
    func _applyIf<V: View>(_ condition: Bool, _ transform: (Self) -> V) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
