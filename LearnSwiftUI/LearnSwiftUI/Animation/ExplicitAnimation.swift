//
//  ExplicitAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 04/08/24.
//

import SwiftUI

struct ExplicitAnimation: View {
    @State private var flag = false
    @State private var isHeightChanged = false
    
    var body: some View {
        Rectangle()
            .frame(width: flag ? 200 : 100, height: isHeightChanged ? 200 : 100)
            .onTapGesture {
                // Since this state change is not part of explicit animation
                // this will not be animated
                isHeightChanged.toggle()
                withAnimation {
                    // This is explicit only this propert needs to be animated
                    flag.toggle()
                }
            }
    }
}

struct ExplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimation()
    }
}
