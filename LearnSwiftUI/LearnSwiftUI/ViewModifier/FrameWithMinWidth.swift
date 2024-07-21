//
//  FrameWithMinWidth.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 21/07/24.
//

import SwiftUI

struct FrameWithMinWidth: View {
    var body: some View {
        Text("Hello, World! Here since maxWidth becoomes Text width so frame size will clamp the proposed size given to it with this max size")
            .frame(minWidth: 0)
            .border(Color.red)
            .padding() // padding proposes (P.W - 2X) and (P.H - 2Y)
        // so padding size is size of subview + 2X and 2Y)
    }
}

struct FrameWithMinWidth_Previews: PreviewProvider {
    static var previews: some View {
        FrameWithMinWidth()
    }
}
