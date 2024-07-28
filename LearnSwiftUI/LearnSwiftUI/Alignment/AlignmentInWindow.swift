//
//  AlignmentInWindow.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 28/07/24.
//

import SwiftUI

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
                .border(.red)
            Rectangle()
                .frame(width: 50, height: 60)
            
        }
        .border(.black)
    }
}

struct AlignmentInWindow_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentInWindow()
    }
}
