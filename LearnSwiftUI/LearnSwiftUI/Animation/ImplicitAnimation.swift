//
//  ImplicitAnimation.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 01/08/24.
//

import SwiftUI

struct ImplicitAnimation: View {
    @State private var flag = false
    
    var body: some View {
        Rectangle()
            .foregroundColor(.red)
            .frame(width: flag ? 100 : 50, height: flag ?  100 : 50)
            // imp to apply it as close as possible to the view modifier it needst to animate
            .animation(.linear, value: flag)
            .onTapGesture {
                flag.toggle()
            }
    }
}

struct ImplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimation()
    }
}
