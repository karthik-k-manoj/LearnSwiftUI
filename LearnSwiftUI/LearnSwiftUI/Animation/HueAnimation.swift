//
//  HueAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 02/08/24.
//

import SwiftUI

struct HueAnimation: View {
    @State private var hueRotate = false
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
                .hueRotation(Angle.degrees(hueRotate ? 180 : 0))
                .animation(.easeInOut(duration: 2), value: hueRotate)
            Divider()
            AngularGradient(gradient: Gradient(colors: [.red, .blue]), center: .center)
                .hueRotation(Angle.degrees(hueRotate ? 360 : 0))
                .mask(Circle())
                .frame(width: 200, height: 200)
                .animation(Animation.easeInOut(duration: 2), value: hueRotate)
            
            Spacer()
            Button("Animate") {
                hueRotate.toggle()
            }
        }
    }
}

struct HueAnimation_Previews: PreviewProvider {
    static var previews: some View {
        HueAnimation()
    }
}
