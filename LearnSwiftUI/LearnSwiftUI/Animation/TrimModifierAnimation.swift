//
//  TrimModifierAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 02/08/24.
//

import SwiftUI

struct TrimModifierAnimation: View {
    @State private var animateTrim = false
    @State private var circleTrim: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Text("Animate Trim")
                .font(.title)
                .bold()

            Circle()
                .trim(from: 0.5, to: circleTrim)
                .stroke(Color.red, style: StrokeStyle(lineWidth: 30, lineCap: CGLineCap.round))
                .frame(height: 150)
                .rotationEffect(.degrees(180))
                .animation(.default, value: animateTrim)
                .padding(.bottom, 20)
            Button("Animate Trim") {
                animateTrim.toggle()
                circleTrim = animateTrim ? 0.5 : 1.0
            }
        }
        .font(.title2)
    }
}

struct TrimModifierAnimation_Previews: PreviewProvider {
    static var previews: some View {
        TrimModifierAnimation()
    }
}
