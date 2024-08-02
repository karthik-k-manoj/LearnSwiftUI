//
//  AnimateCornerRadius.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 02/08/24.
//

import SwiftUI

struct AnimateCornerRadius: View {
    @State private var animateCornerRadius = false
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.red)
                .cornerRadius(animateCornerRadius ? 0 : 75)
                .frame(width: 150, height: 150)
                .animation(.default, value: animateCornerRadius)
            
            Button("Animate") {
                animateCornerRadius.toggle()
            }
            .font(.title)
            .foregroundColor(.black)
            .bold()
            .padding(20)
        }
    
    }
}

struct AnimateCornerRadius_Previews: PreviewProvider {
    static var previews: some View {
        AnimateCornerRadius()
    }
}
