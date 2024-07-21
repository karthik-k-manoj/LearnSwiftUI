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
            // proposes this size from the frame which is a square
            // it needs to create an a size with an aspect ratio
            // of the child view which fill the entire image
            .aspectRatio(contentMode: .fill)
            .border(Color.black)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .border(Color.red)
            // aspect ratio size will be the size of its child.
            // so we want a square size to be proposed and it should
            // be returned as the child size. Hence we have used
            // flexible frame that accepts the proposed size using
            // min and max as 0 and infinity respectively.
            .aspectRatio(1, contentMode: .fit)
            .border(Color.green)
            .clipped()
    }
}

struct FlexibleFrameExample_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleFrameExample()
    }
}
