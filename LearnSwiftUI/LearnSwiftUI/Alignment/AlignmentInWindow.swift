//
//  AlignmentInWindow.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 28/07/24.
//

import SwiftUI

struct MyCustomLeadingAlignemnt: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        0
    }
}

extension HorizontalAlignment {
    static let myLeading = HorizontalAlignment(MyCustomLeadingAlignemnt.self)
}

struct AlignmentInWindow: View {
    var body: some View {
        HStack(alignment: .top) {
            Rectangle()
                .fill(.red)
                .frame(width: 50, height: 40)
            Text("Hello World")
                .alignmentGuide(VerticalAlignment.top, computeValue: { dim in
                    dim[.bottom]
                })
                .alignmentGuide(HorizontalAlignment.myLeading, computeValue: { dim in
                    dim.width / 2
                })
                .border(.red)
            Rectangle()
                .frame(width: 50, height: 60)
            
        }
        .alignmentGuide(HorizontalAlignment.myLeading, computeValue: { dim in
            dim[.leading]
        })
        .frame(width: 200, height: 400, alignment: Alignment(horizontal: .myLeading, vertical: .center))
        .border(.black)
    }
}

struct AlignmentInWindow_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentInWindow()
    }
}
