//
//  SetTimingCurveFunction1.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 21/08/24.
//

import SwiftUI

// Method 1, associated with specific dependencies, suitable for only two situations
// Either the isRed is true or false

struct SetTimingCurveFunction1: View {
    @State private var isRed: Bool = false
    var body: some View {
        VStack {
            Rectangle()
                .fill(isRed ? .red : .yellow)
                .animation(.easeInOut, value: isRed)
                
            Button("Method 1: Animate") {
                isRed.toggle()
            }
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SetTimingCurveFunction1()
}
