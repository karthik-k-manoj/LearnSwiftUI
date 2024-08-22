//
//  WithAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 18/08/24.
//

import SwiftUI

struct WithAnimation: View {
    @State var red = false
    @State var x: CGFloat = 0
    
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .fill(red ? .red : .blue)
                .frame(width: 30, height: 30)
                .offset(x: x)
            Spacer()
            Button("Animate") {
                if x == 0 {
                    x = 100
                } else {
                    x = 0
                }
                
                withAnimation(.easeIn(duration: 1)) {
                    red.toggle()
                }
            }
        }
        .frame(width: 500, height: 300)
        .border(.red)
    }
}

#Preview {
    WithAnimation()
}

extension View {
    @ViewBuilder
    func transactionMonitor(_ title: String, _ showAnimation: Bool = true) -> some View {
        transaction { transaction in
            print(title, terminator: showAnimation ? ": " : "\n")
            if showAnimation {
                print(transaction.animation ?? "nil")
            }
        }
    }
}
