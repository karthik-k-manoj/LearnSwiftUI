//
//  TextDemo.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 09/09/24.
//

import SwiftUI

struct TextDemo: View {
    @State var width: CGFloat = 100
    
    var body: some View {
        VStack {
            Slider(value: $width, in: 30...300)
            ViewThatFits {
                Text("Fatbobman's Swift Weekly")
                Text("Fatbobman's Weekly")
                Text("Fat's Weekly")
                Text("Weekly")
                    .fixedSize()
            }
            .frame(width: width)
            .border(.red)
        }
    }
}

#Preview {
    TextDemo()
}
