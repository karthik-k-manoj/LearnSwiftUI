//
//  FrameWidthAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 01/08/24.
//

import SwiftUI

struct FrameWidthAnimation: View {
    @State private var flag = false
    
    var body: some View {
        Rectangle()
            .foregroundColor(.red)
            .frame(width: flag ? 100: 50, height: 100)
            .onTapGesture {
                withAnimation(.linear) {
                    flag.toggle()
                }
            }
    }
}

struct FrameWidthAnimation_Previews: PreviewProvider {
    static var previews: some View {
        FrameWidthAnimation()
    }
}
