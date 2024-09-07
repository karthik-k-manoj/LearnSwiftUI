//
//  ViewThatFits2.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 07/09/24.
//

import SwiftUI

struct ViewThatFits2_1: View {
    var body: some View {
        VStack {
            Text("GeometryReader has been present since the birth of SwiftUI, playing a crucial role in many scenarios.")
                .fixedSize()
            
            Rectangle().fill(.orange)
                .fixedSize()
            Circle().fill(.red)
                .fixedSize()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<50) { i in
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 30, height: 30)
                            .overlay {
                                Text("\(i)")
                                    .foregroundStyle(.white)
                            }
                    }
                }
            }
            .fixedSize()

            // VStack asks each child view for its ideal width,
            // uses the max value as its own required size and
            // passes it as the proposed size to child views during
            // final layout (place subviews)
            // Height: VStack sums ideal height of all child views plus spacing as it's own required height
            VStack {
                Text("GeometryReader has been present since the birth of SwiftUI, playing a crucial role in many scenarios.")
                
                Rectangle().fill(.yellow)
            }
            .fixedSize()
            
        }
    }
}

#Preview {
    ViewThatFits2_1()
}
