//
//  AnimatablePair.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 18/08/24.
//

// When there are multiple mutable dependencies for the animatable element, animatable data
// should be set to `AnimatablePair` type so that SwiftUI can pass animation interpolation data that belongs to different dependencies

// AnimatablePair conforsm to VectorArithmetic protocol and requires the wrapped numberical types
// also conform to VectorArithmetic protocol

// following code demostrates usage of AnimatablePair and how to view interolated data from two different timing curve function
import SwiftUI

struct AnimationDataMonitorViewPair: View, Animatable {
    static var timeStamp = Date()
    
    var number1: Double
    var number2: Double
    
    // when rendering SU detects that this view is `Animatable` and continues to call animatableData based on
    // values provided by the timing curve function after the state has changed
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(number1, number2) }
        set {
            number1 = newValue.first
            number2 = newValue.second
        }
    }
    
    var body: some View {
        let duration = Date().timeIntervalSince(Self.timeStamp).formatted(.number.precision(.fractionLength(2)))
        let currentNumber1 = number1.formatted(.number.precision(.fractionLength(2)))
        let currentNumber2 = number2.formatted(.number.precision(.fractionLength(2)))
        let _ = print(duration, currentNumber1, currentNumber2, separator: ", ")
        
        HStack {
            Text("Prefix")
                .foregroundStyle(.green)
            Text(number1, format: .number.precision(.fractionLength(3)))
                .foregroundStyle(.red)
            Text(number2, format: .number.precision(.fractionLength(3)))
                .foregroundStyle(.blue)
        }
    }
}

struct AnimatablePairs: View {
    @State var startNumber1 = false
    @State var startNumber2 = false
    
    var body: some View {
        VStack {
            AnimationDataMonitorViewPair(number1: startNumber1 ? 1 : 0, number2: startNumber2 ? 1: 0)
            Button("Animate") {
                AnimationDataMonitorViewPair.timeStamp = Date()
                withAnimation(.linear) {
                    startNumber1.toggle()
                }
                withAnimation(.easeInOut) {
                    startNumber2.toggle()
                }
            }
        }
        .frame(width: 300, height: 300)
    }
}

#Preview {
    AnimatablePairs()
}
