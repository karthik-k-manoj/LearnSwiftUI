//
//  BreathingAppView.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 03/08/24.
//

import SwiftUI

struct BreathingAppView: View {
    @State var scaleUpDown = false
    @State var rotateInOut = false
    @State var moveInOut = true
    
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.green, .white]),
                            startPoint: .top,
                            endPoint: .bottom
                        ))
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? -60 : 0)
                Circle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.green, .white]),
                        startPoint: .bottom,
                        endPoint: .top
                    ))
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? 60 : 0)
            }
            .opacity(0.5)
            
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.green, .white]),
                            startPoint: .top,
                            endPoint: .bottom
                        ))
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? -60 : 0)
                Circle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.green, .white]),
                        startPoint: .bottom,
                        endPoint: .top
                    ))
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? 60 : 0)
            }
            .opacity(0.5)
            .rotationEffect(.degrees(60))
            
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.green, .white]),
                            startPoint: .top,
                            endPoint: .bottom
                        ))
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? -60 : 0)
                Circle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.green, .white]),
                        startPoint: .bottom,
                        endPoint: .top
                    ))
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? 60 : 0)
            }
            .opacity(0.5)
            .rotationEffect(.degrees(120))
        }
        .rotationEffect(.degrees(rotateInOut ? 90 : 0))
        .scaleEffect(scaleUpDown ? 1/4 : 1)
        .animation(.easeInOut.repeatForever().speed(1/8), value: scaleUpDown)
        .onAppear {
            rotateInOut.toggle()
            scaleUpDown.toggle()
            moveInOut.toggle()
        }
    }
}

struct BreathingAppView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingAppView()
    }
}
