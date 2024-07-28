//
//  FixedSizeWithOverlayBadge.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 22/07/24.
//

import SwiftUI

struct FixedSizeWithOverlayBadge: View {
    var body: some View {
        Text("Hello World").border(Color.red).offset(x: 40)
    }
}

extension View {
    func badge<Badge: View>(@ViewBuilder contents: () -> Badge) -> some View {
        self.overlay(alignment: .topTrailing) {
            contents()
                .alignmentGuide(.top) { dim in
                    dim[explicit: .top]!
                }
                .alignmentGuide(.trailing) { dim in
                    dim.width / 2
                }
        }
    }
}

struct FixedSizeWithOverlayBadge_Previews: PreviewProvider {
    static var previews: some View {
        FixedSizeWithOverlayBadge()
    }
}
