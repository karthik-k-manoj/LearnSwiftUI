//
//  FlexibleFrame.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 21/07/24.
//

import SwiftUI

/*
 Flexible frame allows us to specify
 a minimum, ideal and maximum value for each dimension. We can think of a frame as a "wrapper" view around its child that can both change the proposal to its child and change the reported size.
 */


struct FlexibleFrame: View {
    var body: some View {
        Text("Hello World")

            .fixedSize()
            .debugLog("Text")
            // it says you give any size, I will clamp it and give it to child
            // but if I have one missing constraint
            // I will use my childs size as that constraint.
            // and report that size
            // here child says I am 88 which will be the
            // minWidth for the flexible frame. 88 > 50 (which was the proposed size for the flexible frame
            // hence 88 will be the width for the flexible frame
            // but outer flexible frame has a maximum width of
            // 50 and minimum width of 80. It is going to choose
            // 50 which is closer to the propsal size that is
            .frame(maxWidth: .infinity)
            .border(Color.red)
            .debugLog("FF")
            .frame(maxWidth: 50, alignment: .leading)
            .border(Color.black)
            .debugLog("Outer Frame")
            .padding(8)
            .background { Color.accentColor }
    }
}

struct FlexibleFrame_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleFrame()
    }
}
