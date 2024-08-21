//
//  isContinuous.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 21/08/24.
//

import SwiftUI

struct isContinuous: View {
    @GestureState var position: CGPoint = .zero
    
    var body: some View {
        VStack {
            Circle()
                .fill(.orange)
                .frame(width: 30, height: 50)
                .offset(x: position.x, y: position.y)
                .transaction {
                    if $0.isContinuous {
                        $0.animation = nil
                    } else {
                        $0.animation = .easeIn(duration: 1)
                    }
                }
                .gesture(
                    DragGesture()
                        .updating($position, body: { current, state, transaction in
                            print("current translation width", current.translation.width)
                            print("current translation height", current.translation.height)
                            state = .init(x: current.translation.width, y: current.translation.height)
                            print("since a closure this is called multiple times")
                            transaction.isContinuous = true
                        })
                )
        }
        .frame(width: 400, height: 500)
    }
}

#Preview {
    isContinuous()
}
