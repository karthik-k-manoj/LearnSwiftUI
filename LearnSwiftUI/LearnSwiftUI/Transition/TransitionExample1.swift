//
//  TransitionExample1.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 17/08/24.
//

import SwiftUI

struct TransitionExample1: View {
    @State private var flag = true
    
    var body: some View {
        VStack{
            if flag {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .transition(.slide)
            }
            Button("Click me") {
                flag.toggle()
            }
        }
    }
}

#Preview {
    TransitionExample1()
}
