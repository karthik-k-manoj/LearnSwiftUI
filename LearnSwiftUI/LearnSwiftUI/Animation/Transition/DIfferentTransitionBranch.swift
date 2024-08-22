//
//  DIfferentTransitionBranch.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 22/08/24.
//

import SwiftUI

struct DIfferentTransitionBranch: View {
    @State private var show = false
    
    var body: some View {
        VStack {
            VStack {
                if !show {
                    Text("Hello")
                        .transition(.scale)
                } else {
                    Text("Hello")
                        .offset(y: 100)
                        .transition(.move(edge: .bottom))
                }
            }
            .animation(.easeIn, value: show)
            Spacer()
            Button("Toggle \(show)") {
                show.toggle()
            }
        }
      
    }
    
}

#Preview {
    DIfferentTransitionBranch()
}
