//
//  FixedSizeWithOverlayBadge.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 22/07/24.
//

import SwiftUI

struct FixedSizeWithOverlayBadge: View {
    var body: some View {
        Text("1")
            .badge {
            Text("2023").font(.caption)
        }
    }
}

extension View {
    func badge<Badge: View>(@ViewBuilder contents: () -> Badge) -> some View {
        self.overlay(alignment: .topTrailing) {
            contents()
                .padding(3)
                .background {
                    RoundedRectangle(cornerRadius: 5).fill(Color.teal)
                }
                .fixedSize()
        }
    }
}

struct FixedSizeWithOverlayBadge_Previews: PreviewProvider {
    static var previews: some View {
        FixedSizeWithOverlayBadge()
    }
}
