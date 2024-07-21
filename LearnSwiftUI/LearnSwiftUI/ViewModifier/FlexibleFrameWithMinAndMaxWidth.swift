//
//  FlexibleFrameWithMinAndMaxWidth.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 21/07/24.
//

import SwiftUI

struct FlexibleFrameWithMinAndMaxWidth: View {
    var body: some View {
        Text("Here the text will be it's own size but you can see frame is what is proposed to it")
            .fixedSize()
            .frame(minWidth: 0, maxWidth: .infinity)
            .border(Color.red)
            .frame(width: 200)
        
        // when this kind of frame is set with min and max
        // then this means its size will be the proposed size
        // but height is from the child view even though
        // we propose a larger height
    }
}

struct FlexibleFrameWithMinAndMaxWidth_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleFrameWithMinAndMaxWidth()
    }
}
