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


struct WhatIsAView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WhatIsAView_Previews: PreviewProvider {
    static var previews: some View {
        WhatIsAView()
    }
}