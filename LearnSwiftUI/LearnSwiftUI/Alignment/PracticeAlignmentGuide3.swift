//
//  PracticeAlignmentGuide3.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 27/07/24.
//

import SwiftUI

struct PracticeAlignmentGuide3: View {
    var body: some View {
        Text("Hello")
            .alignmentGuide(HorizontalAlignment.center, computeValue: { dim in
                dim[.leading]
            })
            .frame(minWidth: 0, maxWidth: 170, idealHeight: 60)
            .background(Color.orange)
            .alignmentGuide(HorizontalAlignment.center, computeValue: { dim in
                dim[.trailing]
            })
            .overlay(alignment: .topTrailing) {
                Text("badge")
                    .padding(4)
                    .foregroundColor(.black)
                    .background {
                        Color.green
                            .frame(width: 100, height: 90)
                    }
                    .clipped()
                    .overlay(alignment: .topTrailing) {
                         Text("Super")
                            .foregroundColor(.black)
                            .background(Color.red)
                            .alignmentGuide(HorizontalAlignment.trailing) { dim in
                                dim[.leading]
                            }
                            .alignmentGuide(VerticalAlignment.top) { dim in
                                dim[.bottom]
                            }
                    }
                    .alignmentGuide(HorizontalAlignment.trailing) { dim in
                        dim[.leading]
                    }
                    .alignmentGuide(VerticalAlignment.top) { dim in
                        dim[.bottom]
                    }
            }
            .border(.black) // I am border I have set aligment to be center. first border should be placed in its parent view using
            // if any custom alignment guide theb it is used to align it to the outer frame
            // and border shape is aligned to the primary child view and hence you can see black border outside orange box
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: 300, height: 500)
    }
}

struct PracticeAlignmentGuide3_Previews: PreviewProvider {
    static var previews: some View {
        PracticeAlignmentGuide3()
    }
}
