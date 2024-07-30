//
//  CustomComponentStyle.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 30/07/24.
//

import SwiftUI

/*
 When we want to create a custom component that's
 styleable through the env similar to how SU button
 can be styled with `.buttonStyle` API, general approach
 is the same as with regular env valyes. Howwever
 we need to do a little bit more work to get the types right
 
We want to have the followign API for the badge
 
Text("Test")
 .badge {
    Text(3000,  format: .numer)
 }
 */

/*
 the badge should render withe default badge style, but we want to be able to
 override the style later in the view hierarchy using an API like this
 
 someView
 .badgeStyle(.custom)
 */

/*
 All the badges contained within someView  should recieve that new custom  badge style
 
 to build this we'll do the following
 
 1) create a protocol `BadgeStyle` that defines the interface for a badge style
 
 2) create an env key for the badge style
 
 3) use the custom badge style within the badge modifier
 
 the protocol for our basge style is similar to ViewModifier protocol. it requires
 
 a single body method that wraps existing view in a badge. We only want this style
 
 to be responsible froa applying some sort of badge chrome to the label - it doesn't need to concern itself with positioning the badge relative to the view as that will be done in the badge modifier
 
 so we have a Text View which is wrapped inside a BADGE and that text view will
 be applied few modifiers which is what the Badge view wraps
 
 Note that makeBody method takes an AnyView since we need a conrete view type here to make this code compile
 */


protocol BadgeStyle {
    associatedtype Body: View
    
    @ViewBuilder func makeBody(_ label: AnyView) -> Body
}

struct DefaultBadgeStyle: BadgeStyle {
    var color: Color = .red
    
    func makeBody(_ label: AnyView) -> some View {
        label
            .font(.caption)
            .foregroundColor(.white)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .background {
                Capsule(style: .continuous)
                    .fill(color)
            }
    }
}

/*
 However when we want to create an env key, we can't just use `DefaultBadgeStyle` as the type for the keys value.
 That would prevent us from ever using a custom badge style with a different type. Instead we'll use an existential to
 hide the concrete type. Essentialy this wraps the conrete type in a box (similar to how AnyView wraps a concrete view in box)
 
 here's the env key and corresponding property
 */

enum BadgeStyleKey: EnvironmentKey {
    static var defaultValue: any BadgeStyle = DefaultBadgeStyle()
}

extension EnvironmentValues {
    var badgeStyle: any BadgeStyle {
        get { self[BadgeStyleKey.self] }
        
        set {
            self[BadgeStyleKey.self] = newValue
        }
    }
}

/*
 to use badge style, we'll create a custom view modifier that reads it from the env, transforms the label and position it according
 to the specified alignment. It also takes care of making the label its ideal size (as we don't want the badge to be dependent on the size
 of the view it is applied. The layout code with alignment guide is similar to what we discussed in the alignment section of the layout chapter
 */

extension View {
    func badgeModifier<BadgeView: View>(
        alignment: Alignment = .topTrailing,
        _ content: () -> BadgeView
    ) -> some View {
        modifier(CustomComponentStyle.BadgeModifier(alignment: alignment, label: content()))
    }
}

struct CustomComponentStyle: View {
    // create a view modifier that wraps a view and does some modification with the X view passed to it
    // so Badge is a container view which wraps the child view and performs some modfification with the help of an overlay and the actual overlay view
    
    struct BadgeModifier<BadgeView: View>: ViewModifier {
        var alignment: Alignment = .topTrailing
        var label: BadgeView
        
        @Environment(\.badgeStyle) private var badgeStyle
        
        // gets the current body of the caller
        func body(content: Content) -> some View {
            content
                .overlay(alignment: alignment) {
                    AnyView(badgeStyle.makeBody(AnyView(label)))
                        .alignmentGuide(alignment.horizontal) { dim in
                            dim[HorizontalAlignment.center]
                        }
                        .alignmentGuide(alignment.vertical) { dim in
                            dim[VerticalAlignment.center]
                        }
                        .fixedSize()
                }
        }
    }

    
    var body: some View {
        Text("Hello World")
            .badgeModifier {
                Text("3000")
            }
            .border(.red)
           .frame(width: 30, height: 50)
    }
}

struct CustomComponentStyle_Previews: PreviewProvider {
    static var previews: some View {
        CustomComponentStyle()
    }
}
