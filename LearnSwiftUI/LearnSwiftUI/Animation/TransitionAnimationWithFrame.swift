//
//  TransitionAnimationWithFrame.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 01/08/24.
//

import SwiftUI

struct TransitionAnimationWithFrame: View {
    @State private var flag = false
    
    var body: some View {
        let rectangle = Rectangle()
            .foregroundColor(.blue)
            .onTapGesture {
                withAnimation {
                    flag.toggle()
                }
            }
        
        if flag {
            rectangle
                .frame(width: 200, height: 50)
        } else {
            rectangle
                .frame(width: 100, height: 50)
        }
    }
}

struct TransitionAnimationWithFrame_Previews: PreviewProvider {
    static var previews: some View {
        TransitionAnimationWithFrame()
    }
}
