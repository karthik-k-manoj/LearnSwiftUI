//
//  OffsetAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 02/08/24.
//

import SwiftUI

struct OffsetAnimation: View {
    @State private var moveRight = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(.blue)
                .frame(width: 50, height: 50)
                .offset(x: moveRight ? 150 : 0, y: 350)
                .animation(Animation.easeInOut(duration: 2), value: moveRight)
            Spacer()
            Button("Animate") {
                moveRight.toggle()
            }
        }
    }
}

struct OffsetAnimation_Previews: PreviewProvider {
    static var previews: some View {
        OffsetAnimation()
    }
}
