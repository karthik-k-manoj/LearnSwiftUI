//
//  NonViewSubtreeAnimatingCheck.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 04/08/24.
//

import SwiftUI

struct NonViewSubtreeAnimatingCheck: View {
    @State private var isWidthChanged = false
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(.red)
            .animation(.default, value: isWidthChanged)
            .frame(width: isWidthChanged ? 200 : 100, height: 50)
            .background(.yellow)
            .onTapGesture {
                isWidthChanged.toggle()
            }
        
        // the frame is not animating because frame modifier is not under animation modifier. Need to check in later iOS 17
    }
}

struct NonViewSubtreeAnimatingCheck_Previews: PreviewProvider {
    static var previews: some View {
        NonViewSubtreeAnimatingCheck()
    }
}
