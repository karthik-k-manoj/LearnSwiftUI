//
//  ZStack_.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 24/07/24.
//

import SwiftUI

struct ZStack_: View {
    var body: some View {
        ZStack {
            Color.red
                .frame(width: 50, height: 60)
        
            Color.blue
                .frame(height: 50)
            
            Text("Hello World How are you")
                .debugLog("Text")
        }
        .border(.black, width: 2)
        .frame(width: 100, height: 100)
    }
}

struct ZStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack_()
    }
}
