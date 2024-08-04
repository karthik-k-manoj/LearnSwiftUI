//
//  AnimationWithBody.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 01/08/24.
//

import SwiftUI

struct AnimationWithBody: View {
    @State private var flag = true
    
    var body: some View {
        Text("Hello World")
            .rotationEffect(flag ? .zero : .degrees(90))
            .animation(.default)
            .onTapGesture {
                flag.toggle()
            }
    }
}

struct AnimationWithBody_Previews: PreviewProvider {
    static var previews: some View {
        AnimationWithBody()
    }
}

/*
 Button("Tap me") {
     animationAmount += 1
 }
 .padding(50)
 .foregroundColor(.white)
 .background(.red)
 .clipShape(Circle())
 .scaleEffect(animationAmount)
 .blur(radius: (animationAmount - 1) * 3)
 .animation(.linear, value: animationAmount)

 */

/*
 1) .animation(_:body:) takes a body closure but
 doesn't take a value parameter to control when
 the animation will take effect (if value was present, on chaneg of value the animation will take effect. This means that the animatable modifiers within the body closure will always animate when their parameters change, regardless where this change originated
 
 For e.g. we have 3 state properties inside the closure, if any one of them changes then the closure is rexeucted with animating the change
 
  but with `animation(_:value:)` we are specifying on which value change we need to animate below subtree
 
 
 2) need to understand it better

 */

/*
 Understanding it better the animation with body has 2 pitfalls
 
 1) contrary to the animation (value) the new animation modifier with closure doesn't take a value parameter to control when the animation will take effect, This means that the animatable modifiers within body closure will always animate when their parameter when their parameter changes, regadrless of where this changed originated.
 
 
 2) As mentioned some modifiers like .frame .offset .foregroundColor might have unexpected behaviour in conjuction with animations. These modifiers take effect at the leaf view and not at the position in the view tree where we insert them. Therefore these modifiers might still animate although there was no animation present at the pointin the view tree where used then. If we specify one of these "out-of-place" modifiers inside the body closure of `.animation(_:body:), no animation will take because animttion is present at the leaf view) ??
 
 Instead of defining an animation for a certain view subtree and particular value changing we can also scope an animation to a particular state changes which we call with explict animation
 
 */
