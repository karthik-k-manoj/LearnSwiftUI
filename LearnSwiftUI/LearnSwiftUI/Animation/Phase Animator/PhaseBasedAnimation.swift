//
//  PhaseBasedAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 26/08/24.
//

import SwiftUI

struct PhaseBasedAnimation: View {
    @State private var shakes = 0
    
    var body: some View {
        if #available(iOS 17.0, *) {
            Button("Shakes") {
                shakes += 1
            }
            .phaseAnimator([0.0, -20.0, 20.0], trigger: shakes) { content, offset in
                content.offset(x: offset)
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
}

#Preview {
    PhaseBasedAnimation()
}
