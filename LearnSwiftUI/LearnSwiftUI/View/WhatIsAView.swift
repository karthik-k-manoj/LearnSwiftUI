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
