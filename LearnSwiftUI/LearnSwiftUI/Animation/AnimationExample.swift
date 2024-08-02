//
//  AnimationExample.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 02/08/24.
//

import SwiftUI

struct AnimationExample: View {
    @State private var scaleUp: CGFloat = 1
    
    var body: some View {
        Button {
            // this reutrns result of recomputing a view's body with the provided animation
            withAnimation(.interpolatingSpring(stiffness: 60, damping: 2).repeatForever(autoreverses: true)) {
                scaleUp *= 1.4
            }
        } label: {
            Text("Scale up")
                .scaleEffect(scaleUp)
        }
        

    }
}

struct AnimationExample_Previews: PreviewProvider {
    static var previews: some View {
        AnimationExample()
    }
}
