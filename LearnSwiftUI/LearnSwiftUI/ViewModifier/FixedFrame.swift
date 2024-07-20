//
//  FixedFrame.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 20/07/24.
//

import SwiftUI

struct FixedFrame: View {
    var body: some View {
        Text("Hello World. This is going to be awesome")
            .frame(width: 100)
            .border(Color.red)
    }
}

struct FixedFrame_Previews: PreviewProvider {
    static var previews: some View {
        FixedFrame()
    }
}
