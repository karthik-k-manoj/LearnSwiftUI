//
//  AboutAnimatable.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 18/08/24.
//

import SwiftUI
/*
 How to use this animation data (interpolation data) to generate animation, it is determined by
 the animatable components associated with specific dependencies
 
 by ahdering to the `Animatable` protocol `View` or `ViewModifier` can acquire the ability to obtain animation data. Many of SwiftUI's official components have already met this protocol such as offset, frame, opacity, fill etc
 */

/*
protocol Animatable {
    // type defining the data to animate
    associatedtype AnimatableData: VectorArithmetic
    
    // data to animate
    var animatableData: Self.AnimatableData { get set }
}
*/

/*
 Note the type of `animatableData` specified in this protocol must conform to `VectorArithmetic` protocol. Beacause only types that conform to VectorArithmetic protocol can be interpolated by timing curve function
 
 when the dep associated with an animatable component change, SU calculates the interpolation using the specified timing curve function and continues to call animatableData property of the animatable component associated with the dependency.
 */

struct AnimationDataMonitorView: View, Animatable {
    static var timeStamp = Date()
    
    var number: Double
    
    // when rendering SU detects that this view is `Animatable` and continues to call animatableData based on
    // values provided by the timing curve function after the state has changed
    var animatableData: Double {
        get { number }
        set {
            number = newValue
        }
    }
    
    var body: some View {
        let duration = Date().timeIntervalSince(Self.timeStamp).formatted(.number.precision(.fractionLength(2)))
        let currentNumber = number.formatted(.number.precision(.fractionLength(2)))
        let _ = print(duration, currentNumber, separator: ", ")
        
        Text(number, format: .number.precision(.fractionLength(3)))
    }
}

struct AboutAnimatable: View {
    @State var startAnimation = false
    var body: some View {
        VStack {
            AnimationDataMonitorView(number: startAnimation ? 1 : 0) // declare two states
                .animation(.linear(duration: 0.3), value: startAnimation) // associated dep and timing curve function
            
            Button("show data") {
                AnimationDataMonitorView.timeStamp = Date()
                startAnimation.toggle() // change dependency
            }
        }
        .frame(width: 300, height: 300)
    }
}

#Preview {
    AboutAnimatable()
}
