//
//  WhatIsColor.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 13/07/24.
//

import SwiftUI

// Color.red is implicity a rectangle shape with fill

struct WhatIsColor: View {
    var body: some View {
        Rectangle()
            .fill(Color.yellow)
            // When using color on background which touches non-safe area,
            // the color would bleed into the non-safe area. To prevent this
            // use `ignoresSafeAreaEdges`. Defaults to `.all`. Pass [] to respect
            // safe area.
            .background(Color.red, ignoresSafeAreaEdges: [])
    }
}

struct WhatIsColor_Previews: PreviewProvider {
    static var previews: some View {
        WhatIsColor()
    }
}
