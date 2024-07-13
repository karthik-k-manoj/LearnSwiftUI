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
    var offset: CGFloat = 0.5
    var corner: UIRectCorner = .bottomLeft
    // rect is reported size for a shape view in which the path will be drawn
    // This is only required method for a shape
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Start point
        path.move(to: .zero)
        // Top left
        path.addLine(to: CGPoint(x: rect.maxX, y: corner == .topLeft ? rect.maxY * offset :  0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: corner == .bottomLeft ? offset * rect.height : rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct TrapeziumShape_Previews: PreviewProvider {
    static var previews: some View {
        let image = Image("myImage")
        
        VStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .border(Color.red)
                .frame(height: 200)
                .clipShape(TrapeziumShape())
                .overlay(content: {
                    TrapeziumShape(offset: 0.5, corner: .bottomLeft)
                        .stroke(Color.black, lineWidth: 1)
                })
                .border(Color.blue)
                .padding(10)
            
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .border(Color.red)
                .frame(height: 200)
                .clipShape(TrapeziumShape(offset: 0.5, corner: .topLeft))
                .overlay(content: {
                    TrapeziumShape(offset: 0.5, corner: .topLeft)
                        .stroke(Color.black, lineWidth: 2)
                })
                .border(Color.blue)
                .padding(10)
                
        }
       
    }
}

/*
 What is `ShapeStyle` and how it is different from `Shape`. Both are protocols
 */
