//
//  HStackWithFlexibleFrame.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 24/07/24.
//

import SwiftUI

extension View {
    func measure() -> some View {
        overlay {
            GeometryReader { proxy in
                Text("\(Int(proxy.size.width)) x \(Int(proxy.size.height))")
            }
        }
    }
}

struct HStackWithFlexibleFrame: View {
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(Color.red)
                .frame(minWidth: 50)
                .debugLog("Red R")
                .measure()
            Rectangle()
                .fill(Color.blue)
                .frame(maxWidth: 100)
                .debugLog("Blue B")
                .measure()
            Rectangle()
                .fill(Color.green)
                .frame(width: 10)
                .debugLog("Green B")
                .measure()
        }
        
        .frame(width: 200, height: 100)
    }
}
/*
 1) frame size is 200 and 100
 2) HStack is proposed a size of 200 x 100
 3) HStack computes flexibility by asking min and max size
 4) R1 min 40 max inf (third)
 5) R2 min 0 max 100 (second)
 6) R3 min 10 max 10 (first)
 7) 200 / 3 = 66.6
 8) Propose it to Green, Green says I want to be 10
 10) 200 - 10 = 190
 11) propose 190 / 2 = 95 to each view

 */

struct HStackWithFlexibleFrame_Previews: PreviewProvider {
    static var previews: some View {
        HStackWithFlexibleFrame()
    }
}
