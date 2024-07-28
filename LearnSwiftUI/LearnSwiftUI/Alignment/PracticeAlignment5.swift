//
//  PracticeAlignment5.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 28/07/24.
//

import SwiftUI

struct PracticeAlignment5: View {
    var body: some View {
        // Geometry reader doesn't respect custom alignment guide of the children
        GeometryReader { _ in
            Rectangle()
                .fill(Color.red)
                .frame(width: 50, height: 50)
                .alignmentGuide(.leading) { dim in
                    dim[.trailing]
                }
                .alignmentGuide(.top) { dim in
                    dim[.bottom]
                }
        }
        .border(.black)
        .frame(width: 100, height: 100)
    }
}

struct PracticeAlignment5_Previews: PreviewProvider {
    static var previews: some View {
        PracticeAlignment5()
    }
}
