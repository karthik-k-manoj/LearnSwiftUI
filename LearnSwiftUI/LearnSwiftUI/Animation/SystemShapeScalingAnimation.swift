//
//  SystemShapeScalingAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 02/08/24.
//

import SwiftUI

struct SystemShapeScalingAnimation: View {
    @State private var scaleBug = false
    
    var body: some View {
        VStack {
            Text("Scale Image")
                .font(.title)
                .bold()
            // This SF symbol is specially with red color filled.
            // Use renderingMode to get the original color
            Image(systemName: "ladybug.fill")
                .renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 150)
                .scaleEffect(scaleBug ? 0.1 : 1)
                .animation(Animation.default, value: scaleBug)
                .padding(10)
            Button("Scale Image") {
                scaleBug.toggle()
            }
        }
        .font(.title2)
    }
}

struct SystemShapeScalingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SystemShapeScalingAnimation()
    }
}
