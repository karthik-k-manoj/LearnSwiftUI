//
//  CustomTransitionDemo.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 22/08/24.
//

import SwiftUI

struct MyTransition: ViewModifier {
    let rotation: Angle
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(rotation) // animatable component
    }
}

extension AnyTransition {
    static var rotation: AnyTransition {
        AnyTransition.modifier(active: MyTransition(rotation: .degrees(360)), identity: MyTransition(rotation: .zero))
    }
}

struct CustomTransitionDemo: View {
    @State var show = false
    
    // here MyTransition deos not appear to conform to the Animatable protocol, the rotation effect within it (which is an animatable ViewModifier)
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text("Hello")
                if show {
                    Text("World")
                        .transition(.rotation.combined(with: .opacity))
                }
                Spacer()
            }
            .animation(.easeInOut(duration: 2), value: show)
            
            Button(show ? "Hide" : "Show") {
                show.toggle()
            }
            .border(.red)
        }
        .frame(width: 300, height: 300)
        .onChange(of: show) {
            print($0)
        }
    }
}

#Preview {
    CustomTransitionDemo()
}
