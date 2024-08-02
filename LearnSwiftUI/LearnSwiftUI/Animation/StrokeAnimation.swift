//
//  StrokeAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 02/08/24.
//

import SwiftUI

struct StrokeAnimation: View {
    @State private var animateStroke = false
    var body: some View {
        VStack {
            Text("Animated Stroke")
                .font(.title)
                .bold()
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.red, style: StrokeStyle(lineWidth: animateStroke ? 25 : 1))
                .frame(width: 100, height: 100)
                .animation(.default, value: animateStroke)
            Spacer()
            Button("Animate Stroke") {
                animateStroke.toggle()
            }
        }
        .font(.largeTitle)
    }
}

struct StrokeAnimation_Previews: PreviewProvider {
    static var previews: some View {
        StrokeAnimation()
    }
}
