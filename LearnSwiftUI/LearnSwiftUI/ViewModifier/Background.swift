//
//  Background.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 21/07/24.
//

import SwiftUI

struct Background: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .highlight()
    }
}

struct Overlay_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}

extension View {
    func highlight(enabled: Bool = true) -> some View {
        // backgroud view size is always equal to reported size of its
        // subview. But secondary view can have a different size.
        background { if enabled {
            Color.red
                .font(.caption)
                .padding(-10)
                .border(Color.black)
                .debugLog("Size")
        }}
        .border(Color.blue)
} }

