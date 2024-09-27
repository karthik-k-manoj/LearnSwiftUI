//
//  AnimatingAlongPath.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 25/09/24.
//

import SwiftUI

struct ArrowHead: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { p in
            p.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        }.strokedPath(strokeStyle)
    }
}

struct Eight: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { p in
            let start = CGPoint(x: 0.75, y: 0)
            p.move(to: start)
            p.addQuadCurve(to: CGPoint(x: 1, y: 0.5), control: CGPoint(x: 1, y: 0))
            p.addQuadCurve(to: CGPoint(x: 0.75, y: 1), control: CGPoint(x: 1, y: 1))
            p.addCurve(to: CGPoint(x: 0.25, y: 0), control1: CGPoint(x: 0.5, y: 1), control2: CGPoint(x: 0.5, y: 0))
            p.addQuadCurve(to: CGPoint(x: 0, y: 0.5), control: CGPoint(x: 0, y: 0))
            p.addQuadCurve(to: CGPoint(x: 0.25, y: 1), control: CGPoint(x: 0, y: 1))
            p.addCurve(to: start, control1: CGPoint(x: 0.5, y: 1), control2: CGPoint(x: 0.5, y: 0))
        }.applying(CGAffineTransform(scaleX: rect.width, y: rect.height))
    }
}

extension Path {
    func point(at position: CGFloat) -> CGPoint {
        assert(position >= 0 && position <= 1)
        guard position > 0 else { return cgPath.currentPoint }
        return trimmedPath(from: 0, to: position).cgPath.currentPoint
    }
    
    func pointAndAngle(at position: CGFloat) -> (CGPoint, Angle) {
        let p1 = point(at: position)
        let p2 = point(at: (position + 0.01).truncatingRemainder(dividingBy: 1))
        let angle = Angle(radians: Double(atan2(p2.y - p1.y, p2.x - p1.x)))
        return (p1, angle)
    }
}

let strokeStyle = StrokeStyle(lineWidth: 3)

struct OnPathShape<P: Shape, S: Shape>: Shape {
    var shape: S
    let pathShape: P
    var offset: CGFloat // 0...1
    
    var animatableData: CGFloat {
        get {
            offset
            // AnimatablePair(offset, shape.animatableData)
        }
        
        set {
            offset = newValue
           // shape.animatableData = newValue.second
        }
    }
                                            
    func path(in rect: CGRect) -> Path {
        let path = pathShape.path(in: rect)
        let (point, angle) = path.pointAndAngle(at: offset)
        let shapePath = shape.path(in: rect)
        let size = shapePath.boundingRect.size
        let head = shapePath
            .applying(CGAffineTransform(rotationAngle: CGFloat(angle.radians)))
            .offsetBy(dx: point.x - size.width / 2, dy: point.y - size.height / 2)
        var result = Path()
        let trailingLength: CGFloat = 0.2
        let trimFrom = offset - trailingLength
        if trimFrom < 0 {
            result.addPath(path.trimmedPath(from: trimFrom + 1, to: 1).strokedPath(.init()))
        }
        
        result.addPath(path.trimmedPath(from: max(0, trimFrom), to: offset).strokedPath(.init()))
        result = result.strokedPath(strokeStyle)
        result.addPath(head)
        return result
    }
}

struct AnimatingAlongPath: View {
    @State private var position: CGFloat = 0
    var rect: some Shape = Rectangle()
                .size(width: 30, height: 30)
    
    var body: some View {
        VStack {
            ZStack {
                Eight()
                    .stroke(.gray)

                OnPathShape(shape: ArrowHead().size(width: 30, height: 30), pathShape: Eight(), offset: position)
                    .foregroundStyle(.black)
                    .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false), value: position)
            }
            .onAppear(perform: {
                self.position = 1
            })
            .aspectRatio(16/9, contentMode: .fit)
            .padding()
        }
    }
}

#Preview {
    AnimatingAlongPath()
}
