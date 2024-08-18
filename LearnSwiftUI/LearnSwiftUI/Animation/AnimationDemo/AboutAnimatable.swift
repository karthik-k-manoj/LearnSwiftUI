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


struct AboutAnimatable: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AboutAnimatable()
}
