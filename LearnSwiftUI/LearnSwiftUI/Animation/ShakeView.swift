//
//  ShakeView.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 05/08/24.
//

import SwiftUI

struct ShakeView: View {
    @State private var shakes = 0
    
    var body: some View {
        Button("Shakes") { shakes += 1 }
            .modifier(ShakeModifier(numberOfShakes: Double(shakes)))
            .padding(16)
            .background(.red)
            .animation(.easeInOut.speed(0.2), value: shakes)
    }
}

struct ShakeModifier: ViewModifier, Animatable {
    var animatableData: Double {
        get {
            numberOfShakes
        }
        
        set {
            numberOfShakes = newValue
        }
    }
    
    var numberOfShakes: Double
        
    func body(content: Content) -> some View {
        content
            .selfView(data: animatableData)
            .offset(x: -sin(numberOfShakes * 2 * .pi) * 30)
    }
}

extension View {
    func selfView(data: Double) -> Self {
        print("values \(data)")
        return self
    }
}

struct ShakeView_Previews: PreviewProvider {
    static var previews: some View {
        ShakeView()
    }
}
