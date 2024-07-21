//
//  FlexibleFrameMaxWidth.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 21/07/24.
//

import SwiftUI

struct FlexibleFrameMaxWidth: View {
    // here we can see the outer frame proposes
    // small width but inner frame has a condition
    // since frame has only maxWidth specified
    // its minWidth will be the contents size
    // which is say 100.
    // so frame will say I am 100 x height of text
    // so you can see red border moves out of
    // blue border
    var body: some View {
        Text("Hello, world")
            .fixedSize()
            .frame(maxWidth: .infinity)
            .border(Color.red)
            .padding(8)
            .frame(width: 40)
            .border(Color.blue)
    }
}

struct FlexibleFrameMaxWidth_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleFrameMaxWidth()
    }
}
