//
//  BadgeBackground.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 11/07/24.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        Path { path in
            var width: CGFloat = 100
            let height = width
            
            path.move(
                to: CGPoint(
                    x: width * 0.95,
                    y: height * 0.20
                )
            )
            
            HexagonParameters.segments.forEach { segment in
                path.addLine(
                    to: CGPoint(
                        x: width * segment.line.x,
                        y: height * segment.line.y
                    )
                )
                
                path.addQuadCurve(
                    to: CGPoint(
                        x: width * segment.curve.x,
                        y: height * segment.curve.y
                    ),
                    control: CGPoint(
                        x: width * segment.control.x,
                        y: height * segment.control.y
                    )
                )
            }
            
        }
        .fill(.black)
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
