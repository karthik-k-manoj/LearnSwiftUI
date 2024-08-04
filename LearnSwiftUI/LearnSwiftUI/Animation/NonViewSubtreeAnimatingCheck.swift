//
//  NonViewSubtreeAnimatingCheck.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 04/08/24.
//

import SwiftUI

struct NonViewSubtreeAnimatingCheck: View {
    @State private var isWidthChanged = false
    @State private var isHeightChanged = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(.red)
            .frame(width: isWidthChanged ? 200 : 100, height: isHeightChanged ? 100 : 50)
            .background(.yellow)
            // value is `iswidthChanged` that is what the animation modifier is observing at
            // if that changed from the rendered tree then it is going to animate whatever below the animation modifier to the new state. For e.g here we changed height as well
            .animation(.default, value: isWidthChanged)
            .onTapGesture {
                isWidthChanged.toggle()
                isHeightChanged.toggle()
            }
        
        // the frame is not animating because frame modifier is not under animation modifier. Need to check in later iOS 17
    }
}

struct NonViewSubtreeAnimatingCheck_Previews: PreviewProvider {
    static var previews: some View {
        NonViewSubtreeAnimatingCheck()
            .previewLayout(.sizeThatFits)
    }
}
