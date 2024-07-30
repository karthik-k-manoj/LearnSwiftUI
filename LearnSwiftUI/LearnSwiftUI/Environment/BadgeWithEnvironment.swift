//
//  BadgeWithEnvironment.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 30/07/24.
//

import SwiftUI

struct BadgeWithEnvironment: View {
    var body: some View {
        VStack {
            Text("3000")
                .modifier(Badge())
            Text("3000")
                .modifier(Badge())
        }
        .badgeColr(.black)
        // badge will now render with using current tint color
            // falling back to the sysrem default if we don't
            // specify a color. For e.g. we can change the tint color to red for entiree subtree
    }
}

struct Badge: ViewModifier {
    // to read out badge color we'll use env property wrapper inside our badge view
    // modifier
    @Environment(\.badgeColor) private var badgeColor
    
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.white)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .background {
                Capsule(style: .continuous)
                    .fill(badgeColor)
            }
    }
}

// helper to add env badge color value

extension View {
    func badgeColr(_ color: Color) -> some View {
        environment(\.badgeColor, color)
    }
}

enum BadgeColorKey: EnvironmentKey {
    static var defaultValue: Color = .blue
}

extension EnvironmentValues {
    var badgeColor: Color {
        get {
            self[BadgeColorKey.self]
        }
        
        set {
            self[BadgeColorKey.self] = newValue
        }
    }
}

struct BadgeWithEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        BadgeWithEnvironment()
    }
}

/*
 Instead of relying on tint color, we can also create out own env key
 doing so takes two required steps and an optional one
 1) we need to implement custom EnvironmentKey as the key for the baedge color
    and associate the Color type with they key
 
 2) we need an extension on Env values with a property that lets us get and set the value
 
 3) optionally we can provide a helper method on View to easily set the badge Color
 for an entire subtree. This let's us hide the custom keya nd extension and it provides a discoverable API for users
 
 an env key isn't a value but it's defined using a type.
 
 we could use enum or struct for a key by conforming to EnvKey protocol
 
 EnvKey protocol requries us to implement a static defaultValue  property
 
 Because we use Color as thr type, the compiler knows that the value for this
 
 key will always be of type Color. We also provide a `.blue` as the default value
 
 Whenever we try to read the badge color from the env without an explicit value being
 
 set at hat point in the view tree we will get back the default value
 
 In the second step, we'll add a computed property on the `EnvValues` struct.
 
 the name `badgeColor` will be used in key path when we read from when we read from
 
 and write into the env
 
 Note that when we don't specify the badgeColor, the default value will be used.
 
 In general we could say taht default value from the env is always used unless we
 
 we specify override it
 
 For some component we might want to have even more stylign than this. For e.g.
 
 SU buttonStyle modifier (combined with the ButtonStyle protocol) let's us change
 
 how buttons are rendered. To achieve this for our components we can use the env as
 
 well
 */
