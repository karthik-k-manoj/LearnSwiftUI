//
//  TrapeziumShape.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 12/07/24.
//

import SwiftUI

struct TrapeziumShape: Shape {
    // rect is reported size for a shape view in which the path will be drawn
    // This is only required method for a shape
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        return path
    }
}

struct TrapeziumShape_Previews: PreviewProvider {
    static var previews: some View {
        TrapeziumShape()
    }
}
