//
//  FlexibleFrame2.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 21/07/24.
//

import SwiftUI

struct FlexibleFrame2: View {
    var body: some View {
        Text("Here what this size height reports will be the `maxHeight` for the frame. Hence frame will clamp the proposed size to this size. Hence you can see the blue color background whose size is Text size + padding size")
            .border(Color.red)
            .padding(16)
            .frame(minHeight: 0)
            .background { Color.accentColor }
    }
}

extension View {
    func proposedWidthOrGreater() -> some View {
        frame(maxWidth: .infinity)
    }
    
    func acceptProposedWidth() -> some View {
        frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct FlexibleFrame2_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleFrame2()
    }
}
