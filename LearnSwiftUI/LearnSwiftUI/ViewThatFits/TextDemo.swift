//
//  TextDemo.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 09/09/24.
//

import SwiftUI

struct TextDemo: View {
    @State var width: CGFloat = 100
    
//    var body: some View {
//        VStack {
//            Slider(value: $width, in: 30...300)
//            ViewThatFits {
//                Text("Fatbobman's Swift Weekly")
//                Text("Fatbobman's Weekly")
//                Text("Fat's Weekly")
//                Text("Weekly")
//                    .fixedSize()
//            }
//            .frame(width: width)
//            .border(.red)
//        }
//    }
    
//    var body: some View {
//        VStack {
//            Slider(value: $width, in: 30...300)
//            ViewThatFits {
//                Text("Fatbobman's Swift Weekly")
//                    .font(.body)
//                Text("Fatbobman's Swift Weekly")
//                    .font(.subheadline)
//                Text("Fatbobman's Swift Weekly")
//                    .font(.footnote)
//                    .fixedSize()
//            }
//            .frame(width: width)
//            .border(.red)
//        }
//    }
    
   // And for requirements where the content is the same but the size may vary, ViewThatFits may //not be the optimal solution. The following code can provide better results:
    
    var body: some View  {
        VStack {
            Slider(value: $width, in: 30...300)
            Text("Fatbobman's Swift Weekly")
                .lineLimit(1)
                .font(.body)
                .minimumScaleFactor(0.3)
                .frame(width: width)
                .border(.red)
        }
    }
    
    // ViewThatFits is better at providing different alternative content for different spaces.
}

#Preview {
    TextDemo()
}
