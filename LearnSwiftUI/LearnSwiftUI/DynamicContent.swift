//
//  DynamicContent.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 06/07/24.
//

import SwiftUI

struct DynamicContent: View {
    @State var showText: Bool = true

    var body: some View {
        // HStack<TupleView<(Image, Optional<Text>)>>
        HStack {
            Image(systemName: "hand.wave")
            if showText {
                Text("Hello")
            }
            
            let showText = showText ? "True" : "False"
            Button(showText) {
                self.showText.toggle()
            }
        }
        .type()
    }
}


struct DynamicContent_Previews: PreviewProvider {
    static var previews: some View {
        DynamicContent()
    }
}
