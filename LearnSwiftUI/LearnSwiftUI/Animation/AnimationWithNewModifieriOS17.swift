//
//  AnimationWithNewModifieriOS17.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 04/08/24.
//

import SwiftUI

struct AnimationWithNewModifieriOS17: View {
    @State private var flag = false
    
    var body: some View {
        /*
         This will only animate the rotation effect and not the opacity when flag value changes
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .opacity(flag ? 1 : 0)
            .animation(.default) {
                $0.rotationEffect(flag ? .zero : .degree(90))
            }
         */
        
        return Text("")
            .animation(.default) // this will be deprecated This modifier applied animations way too broadly and often
            // caused unexpected behaviors like animation being erroneously applied when device orientation changed
    }
}

struct AnimationWithNewModifieriOS17_Previews: PreviewProvider {
    static var previews: some View {
        AnimationWithNewModifieriOS17()
    }
}

/*
 Implicit animation using the `.animation` view modifier animates everything within their view tree so
 it's important to place the modifier in the correct spot. It's generally a good idea to apply animations
 as locally as possible to avoid unintended side effects especially when we make changes to your code later on
 
 Unfortunately at the time of writing, there are some exceptions to the rule that (.animation(_:value:) only animates changes in it's subtree. For e.g. if we switch `.frame` and animation lines in the eg above, the frame will still animate. In our understanding
 this is intended behaviour.
 */
