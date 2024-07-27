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
            .frame(minWidth: 0, maxWidth: 170, idealHeight: 60)
            .background(Color.orange)
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
            .border(.clear)
            .fixedSize(horizontal: false, vertical: true)
            .alignmentGuide(HorizontalAlignment.center, computeValue: { vim in
                vim.width
            })
            .frame(width: 300, height: 500)
            .border(.clear)
    }
}

struct PracticeAlignmentGuide3_Previews: PreviewProvider {
    static var previews: some View {
        PracticeAlignmentGuide3()
    }
}
