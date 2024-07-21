//
//  FlexibleFrameWithIdealSize.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 21/07/24.
//

import SwiftUI

struct FlexibleFrameWithIdealSize: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .border(Color.red)
            .debugLog("Border")
            .frame(minWidth: 200, idealWidth: 300, idealHeight: 200)
            .fixedSize()
            .border(Color.black)
    }
}

struct FlexibleFrameWithIdealSize_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleFrameWithIdealSize()
    }
}
