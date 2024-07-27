//
//  PracticeAlignmentGuide2.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 27/07/24.
//

import SwiftUI

struct PracticeAlignmentGuide2: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 150, height: 50)
            .border(Color.red)
            .alignmentGuide(HorizontalAlignment.center, computeValue: { dim in
                dim[.leading]
            })
            .background { // it's center alignment guide is .center
                Color.black
                    .opacity(0.5)
                    .frame(width: 200, height: 150)
                    .alignmentGuide(HorizontalAlignment.center) { dim in
                        dim[.leading]
                    }
            }
            .alignmentGuide(HorizontalAlignment.center, computeValue: { dim in
                dim[.leading]
            })
            .frame(width: 250, height: 400)
            .border(.blue)
        
    }
}

struct PracticeAlignmentGuide2_Previews: PreviewProvider {
    static var previews: some View {
        PracticeAlignmentGuide2()
    }
}
