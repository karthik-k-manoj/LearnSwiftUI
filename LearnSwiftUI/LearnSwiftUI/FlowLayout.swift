//
//  FlowLayout.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 10/09/24.
//

import SwiftUI

func layout(sizes: [CGSize], spacing: CGSize = .init(width: 10, height: 10), containerWidth: CGFloat) -> [CGRect] {
    var result: [CGRect] = []
    var currentPosition: CGPoint = .zero
    
    func startNewLine() {
        if currentPosition.x == 0 { return }
        currentPosition.x = 0
        currentPosition.y = result.maxY() + spacing.height
    }
    
    for size in sizes {
        if currentPosition.x + size.width > containerWidth {
            startNewLine()
        }
        
        result.append(CGRect(origin: currentPosition, size: size))
        currentPosition.x += size.width + spacing.width
    }
    
    return result
}

struct FlowLayout: Layout {
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let subviewsSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let frames = layout(sizes: subviewsSizes, containerWidth: bounds.width)
        for (f, subview) in zip(frames, subviews) {
            let offset = CGPoint(x: f.origin.x + bounds.minX, y: f.origin.y + bounds.minY)
            subview.place(at: offset, proposal: .unspecified)
        }
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let containeWidth = proposal.replacingUnspecifiedDimensions().width
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        return layout(sizes: sizes, containerWidth: containeWidth).union().size
    }
}

extension Array where Element == CGRect {
    func maxY() -> Double {
        var initialValue: Double = 0.0
        let output = reduce(into: initialValue) { partialResult, element in
            initialValue =  Swift.max(partialResult, element.height)
        }
        
        return initialValue
    }
    
    func union() -> CGRect {
        .zero
    }
}
