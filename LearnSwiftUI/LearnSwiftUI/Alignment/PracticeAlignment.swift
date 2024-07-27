//
//  PracticeAlignment.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 26/07/24.
//

import SwiftUI

struct PracticeAlignment: View {
    var body: some View {
        Color.red
            .opacity(0.1)
            .frame(width: 180)
            .border(Color.black, width: 6)
            // this is specifiying a custom alignment guide.
            // a built in view where we can give custom alignment guide
            .alignmentGuide(HorizontalAlignment.center, computeValue: { dim in
                0
            })
            // a view can ask its child for custom alignment guide
            .frame(width: 150, height: 300, alignment: .center)
            .border(.green, width: 6)
            .frame(width: 190, height: 300)
            .border(.brown, width: 6)
            .alignmentGuide(HorizontalAlignment.center,  computeValue: { dim in
                dim[.leading]
                
            })
            // this is overlay on top alignment guide
            .overlay(content: {
                Rectangle()
                    .fill(.gray)
                    .opacity(0.2)
                    .alignmentGuide(HorizontalAlignment.center) { dim in
                        dim[.leading   ]
                    }
            })
            .frame(width: 220, height: 500)
            .border(.indigo, width: 5)
//            .alignmentGuide(HorizontalAlignment.center, computeValue: { dim in
//                dim[.leading]
//            })
    }
}

struct PracticeAlignment_Previews: PreviewProvider {
    static var previews: some View {
        PracticeAlignment()
    }
}

/*
 We need to ask the custom alignment for horizontal or vertical
 basically to find the x and y. to calculate custom alignment guide value we need to get the views size
 
 foreground color does not have any layout behaviour so it can ask
 it's child for custom aligment guide.
 */

