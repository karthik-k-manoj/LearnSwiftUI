//
//  TrapeziumShape.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 12/07/24.
//

import SwiftUI

// Think about shape as view that will be whatever the size they are proposed but inside
// it we can draw path to create custom shapes.
/*
 For example if a shape A is proposed 100 x 100. It reports 100 x 100. The path is drawn
 with in reference to this frame size.
 */
struct TrapeziumShape: Shape {
    // rect is reported size for a shape view in which the path will be drawn
    // This is only required method for a shape
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: 0.5 * rect.height))
        path.closeSubpath()
        
        return path
    }
}

struct TrapeziumShape_Previews: PreviewProvider {
    static var previews: some View {
        TrapeziumShape()
            .fill(Color.red)
            // `Color` implements `ShapeStyle`. It accepts proposed size and draws path in that size.
            .border(Color.black)
            .frame(width: 200, height: 100)
    }
}

/*
 What is `ShapeStyle` and how it is different from `Shape`. Both are protocols
 */
