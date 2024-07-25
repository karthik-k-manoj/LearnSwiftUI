//
//  PracticeView.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 25/07/24.
//

import SwiftUI

struct PracticeView: View {
    var body: some View {
        // scroll view proposes nil as it's height to i'ts children
        ScrollView {
            Color.red
            // when the proposed size is `nil` then ideal height is used to propose to child, and that becomes min height to clamp
            // say child say I need to be mininum of 450 then this frame
            // will be 450 height
                .frame(idealHeight: 400, maxHeight: 500)
                .debugLog("Inside  Frame")
        }
        .border(.black)
        .debugLog("Scroll View")
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
