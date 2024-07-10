//
//  LeafViews.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 10/07/24.
//

import SwiftUI

/*
 Leaf views are views that have no subviews.
 */

struct LeafViews: View {
    var body: some View {
        /*
         Let's take a look at `Text`. By default Text views fit themseleves into any proposed size
         Text uses various strageties to make that work; it'll break the text into multiple lines
         (word wrapping), break up words (line wrapping), truncate and finally clip the text
         
         Text always reports back the exact size it needs to render, which is less than or equal
         to proposed size. So we can consider the proposed size as the clamp value. It cannot go
         beyond it and at least the height of one line.
         */
        
        /*
         Here frame is applied with constants so as to propose size is 25 X 50
         and text reports a size which is less than 25 x 50
         */
        Text("Hello, World!")
            .border(.red)
            .frame(width: 25, height: 50)
            .border(.black)
        
        /*
         Here frame is applied with constants so as to propose size is 50 X 50
         and text reports a size which is less than 50 x 50
         */
        Text("Hello, World!")
            .border(.red)
            .frame(width: 50, height: 50)
            .border(.black)
        
        /*
         Here frame is applied with constants so as to propose size is 100 X 50
         and text reports a size which is less than 100 x 50
         */
        Text("Hello, World!")
            .border(.red)
            .frame(width: 100, height: 50)
            .border(.black)
    }
}

struct LeafViews_Previews: PreviewProvider {
    static var previews: some View {
        LeafViews()
    }
}
