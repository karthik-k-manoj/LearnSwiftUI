//
//  OpacityAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 02/08/24.
//

import SwiftUI

// We can use opacit to hide/show view
struct OpacityAnimation: View {
    @State private var appear = true
    
    var body: some View {
        VStack {
            Text("Appear/Disappear")
                .font(.title)
                .bold()
            
            Circle()
                .foregroundColor(.purple)
                .opacity(appear ? 1 : 0)
                .animation(.easeIn, value: appear)
            
            Spacer()
            
            Button("Animate") {
                appear.toggle()
            }
            
            Spacer()
            VStack {
                Text("Overlapping Opacity")
                    .bold()
                Circle()
                    .foregroundColor(.yellow)
                    .frame(height: 100)
                    .opacity(0.5)
                Circle()
                    .foregroundColor(.red)
                    .frame(height: 100)
                    .opacity(0.5)
                    .offset(x: -20, y: -70)
                
            }
        }
        .padding(60)
    }
}

struct OpacityAnimation_Previews: PreviewProvider {
    static var previews: some View {
        OpacityAnimation()
    }
}
