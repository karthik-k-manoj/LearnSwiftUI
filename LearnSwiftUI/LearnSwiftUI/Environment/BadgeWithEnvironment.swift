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
        .tint(.red)
        // badge will now render with using current tint color
            // falling back to the sysrem default if we don't
            // specify a color. For e.g. we can change the tint color to red for entiree subtree
    }
}

struct Badge: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.white)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .background {
                Capsule(style: .continuous)
                    .fill(.tint)
            }
    }
}

struct BadgeWithEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        BadgeWithEnvironment()
    }
}
