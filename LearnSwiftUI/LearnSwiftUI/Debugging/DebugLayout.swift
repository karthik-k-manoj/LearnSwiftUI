//
//  DebugLayout.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 12/07/24.
//

import SwiftUI

struct DebugLayout: Layout {
    let name: String
    let showConsoleSwiftView: Bool
    
    func sizeThatFits(proposal: ProposedViewSize,
                      subviews: Subviews,
                      cache: inout ()) -> CGSize {
        if showConsoleSwiftView {
            log("Propose \(name)", value: "\(proposal.pretty)")
        } else {
            print("Propose \(name), value: \(proposal.pretty)")
        }
        
        let result = subviews[0].sizeThatFits(proposal)
        
        if showConsoleSwiftView {
            log("Report \(name)", value: "\(result.pretty)")
        } else {
            print("Report \(name), value: \(result.pretty)")
        }
        
        return result
    }
    
    func placeSubviews(in bounds: CGRect,
                       proposal: ProposedViewSize,
                       subviews: Subviews,
                       cache: inout ()) {
        subviews[0].place(at: bounds.origin, proposal: proposal)
    }
}
extension View {
    func debugLog(_ name: String, showConsoleSwiftView: Bool = false) -> some View {
        DebugLayout(name: name, showConsoleSwiftView: showConsoleSwiftView) { self }
    }
}
