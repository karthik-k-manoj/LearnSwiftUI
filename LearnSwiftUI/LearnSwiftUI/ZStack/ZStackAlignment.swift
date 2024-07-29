//
//  ZStackAlignment.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 29/07/24.
//

import SwiftUI

/*
 ZStack first has to compute its own size (based on the sizes of its subview and their alignment guides) before it can then use the alignment to place subviews
 */

struct ZStackAlignment: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.teal)
                .frame(width: 50, height: 50)
                .alignmentGuide(VerticalAlignment.center) { dim in
                    dim[.bottom]
                }
            Text("Hello World!")
        }
        .border(.black)
    }
}

struct ZStackAlignment_Previews: PreviewProvider {
    static var previews: some View {
        ZStackAlignment()
    }
}
