//
//  BorderShape.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 13/07/24.
//

import SwiftUI

struct BorderShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: rect[.topLeading])
            path.addLine(to: rect[.topTrailing])
            path.addLine(to: rect[.bottomTrailing])
            path.addLine(to: rect[.init(x: 0.5, y: 0.8)])
            path.addLine(to: rect[.bottomLeading])
            path.addLine(to: rect[.topLeading])
            path.closeSubpath()
        }
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        var result = proposal.replacingUnspecifiedDimensions()
        
        let ratio: CGFloat = 2/3
        let newWidth = ratio * result.height

        if newWidth <= result.width {
            result.width = newWidth
        } else {
            result.height = result.width / ratio
        }
        
        return result
    }
}

struct BorderShape_Previews: PreviewProvider {
    static var previews: some View {
      BorderShape()
            .stroke(Color.black)
            .debugLog("Stroke")
            .debugLog("Aspect Ratio")
            .frame(width: 80, height: 200)
            .border(Color.red)
    }
}

extension CGRect {
    subscript(_ point: UnitPoint) -> CGPoint {
        CGPoint(x: minX + width * point.x, y: minY + height * point.y)
        
    }
}
