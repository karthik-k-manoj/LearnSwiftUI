//
//  FlexibleFrame3.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 24/07/24.
//

import SwiftUI

struct FlexibleFrame3: View {
    var body: some View {
        VStack {
            Image("bigImage")
            // flexible frame will try to clamp the proposed size to it's min and max
            // the clamped size is proposed to child
            // now again it will clamp the proposed size on reporting it's size
            
            /*
             if one of them is specified then other will be taken from the chil
             and then again clamp it before reporting.
             
             so since both are given proposal is returned
             
             if only one was given that other one will be taken from child and clamp the proposal
             */
                .frame(minWidth: 0, maxWidth: .infinity)
                .clipped()
            Text("Hello World")
        }
    }
}

struct FlexibleFrame3_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleFrame3()
    }
}
