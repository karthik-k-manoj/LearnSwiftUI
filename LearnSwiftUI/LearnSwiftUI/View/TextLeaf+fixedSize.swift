//
//  TextLeaf+fixedSize.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 11/07/24.
//

import SwiftUI

struct TextLeaf_fixedSize: View {
    var body: some View {
        /* fixedSize modifier proposes nilxnil to the text. Text will becomes
         its ideal size (size needed to render the content without wrapping or truncation)
         */
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
            .fixedSize()
            .frame(width: 100, height: 50)
            .border(Color.red)
        
        /*
         two paremeters `horizontal` and `vertical` takes a boolean.
         `false` means it will pass down the proposed size from fixedSize
         parent. `true` specifies `nil` is passed to it's subview
         */
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
            .fixedSize(horizontal: true, vertical: false)
            .frame(width: 100, height: 200)
            .border(Color.red)
        
        /*
         This is a good example of how a parent view in SwiftUI cannot expect it's subview to respect the proposed size
         */
        VStack {
            Text("Hello World.!")
                .fixedSize()
                .frame(width: 25, height: 50)
                .border(Color.red)
            
            Text("Hello World.!")
                .fixedSize()
                .frame(width: 50, height: 50)
                .border(Color.red)
            
            Text("Hello World.!")
                .fixedSize()
                .frame(width: 150, height: 50)
                .border(Color.red)
            
        }
    }
}

struct TextLeaf_fixedSize_Previews: PreviewProvider {
    static var previews: some View {
        TextLeaf_fixedSize()
    }
}
