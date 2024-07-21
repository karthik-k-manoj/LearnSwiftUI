//
//  FlexibleFrameExample.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 21/07/24.
//

import SwiftUI

struct FlexibleFrameExample: View {
    var body: some View {
        Image("bigImage2")
            .resizable()
            .debugLog("Image")
            .aspectRatio(contentMode: .fill)
            .debugLog("Ap 2")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .clipped()
            .aspectRatio(1, contentMode: .fit)
            .debugLog("ap 1")
    }
}

struct FlexibleFrameExample_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleFrameExample()
    }
}
