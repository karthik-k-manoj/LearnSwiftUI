//
//  BindingAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 04/08/24.
//

import SwiftUI
/*
 Binding animations are another variant of explicit animation. We can call .animation on a binding which wraps the setter
 of the binding in an explicit animation.
 */

struct BindingAnimation: View {
    @State private var flag = false
    
    var body: some View {
        ToggleRectange(flag: $flag.animation(.default))
    }
}

struct ToggleRectange: View {
    @Binding var flag: Bool
    
    var body: some View {
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .onTapGesture {
                flag.toggle()
            }
    }
}

struct BindingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        BindingAnimation()
    }
}

/*
 Using an animation on a binding can be a good option to apply an explicit animation without modifying the code of the event closure  (or without having an event closure at all)
 
 At first implicit and explicit animation seems to accomplish the same thing. However it's important to note that implicit animations have potentially different effects than the explicit one. For e.g consider the case where a change in the mode layer (by new data being pushed from the server) results in a particular value changing. When using an implicit animation that's scoped to that value the change to the render tree will be animated regadless of the source but the scope withing the view is well defined
 
    With explicit animation we can easily disinguish between updates from model layer and user interaction but we can't directly restrict the animation to certain parts of the view.
 
 there's no right or wrong. Whether we should use an explicit or implicit animation depends on the behaviour we're trching to achieve it's imp to be aware that different ways of defining animation do have potentially different behaviour even though this doesn't necessairly show up in meediate testing
 */
