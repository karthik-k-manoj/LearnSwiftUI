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

struct TextLeaf: View {
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
         Here frame is applied with constants so as to propose a size of 25 X 50
         and text reports a size which is less than 25 x 50
         */
        Text("Hello, World!")
            .border(.red)
            .frame(width: 25, height: 50)
            .border(.black)
        
        /*
         Here frame is applied with constants so as to propose a size of 50 X 50
         and text reports a size which is less than 50 x 50
         */
        Text("Hello, World!")
            .border(.red)
            .frame(width: 50, height: 50)
            .border(.black)
        
        /*
         Here frame is applied with constants so as to propose a size of 100 X 50
         and text reports a size which is less than 100 x 50
         */
        Text("Hello, World!")
            .border(.red)
            .frame(width: 100, height: 50)
            .border(.black)
        
        /*
         `.lintLimit(_ number) lets us specify the maximum number of lines that should be rendered
         regardless of whether or not there's more vertical space proposed. Specifiying nil means
         there's no limit
         */
        
        VStack(spacing: 10) {
            // Consider this as clamping to line height of 2. Maximum it can go to 2 line height.
            Text("Lorem ipsum")
                .lineLimit(2)
                .border(.pink)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .lineLimit(2)
                .border(.pink)
            
            // This is similar to above but with the partial range operator.
            Text("Lorem ipsum")
                .lineLimit(...2)
                .border(.pink)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .lineLimit(...2)
                .border(.pink)
            
            // This is setting the minimum number of lines using partial range operator
            Text("Lorem ipsum")
                .lineLimit(2...)
                .border(.pink)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .lineLimit(2...)
                .border(.pink)
            
            // This is setting the minimum to maximum line height using close range operator
            Text("Lorem ipsum")
                .lineLimit(1...2)
                .border(.pink)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .lineLimit(1...2)
                .border(.pink)
            
            // Specifies maximum number of lines that should be rendered while giving us the option
            // to include space for these lines in the reported size by setting `reservesSpace` to true.
            Text("Lorem ipsum")
                .lineLimit(4, reservesSpace: true)
                .border(.pink)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .lineLimit(4, reservesSpace: true)
                .border(.pink)
        }
        
        VStack(spacing: 10) {
            // Specifies where truncation should be applied
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .lineLimit(2)
                .truncationMode(.head)
            
            HStack {
                Text("This is a long label that will be scaled to fit:")
                    .lineLimit(3)
                    // This will make sure the text is not wrapped or truncated but font size is reduce
                    // to fix into the proposed size.
                    .minimumScaleFactor(0.5)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
            }
        }
        .padding(10)
    }
}

struct LeafViews_Previews: PreviewProvider {
    static var previews: some View {
        TextLeaf()
    }
}
