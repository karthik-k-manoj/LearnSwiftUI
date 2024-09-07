//
//  AdapativeScrolling.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 07/09/24.
//

import SwiftUI

/*
 If the width of content exceeds the allowed width (300) of ViewThatFits, ViewThatFits will choose the last subview that uses ScrollView. In this example, even though ScrollView renders with a width that exceeds the allowed width of ViewThatFits in an ideal state, it is ultimately chosen because it is the last subview. This is also a typical case of inconsistency between judgment and rendering.
 */
struct AdapativeScrolling: View {
    @State var step: CGFloat = 3
    
    var count: Int {
        Int(step)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Count \(count)")
            Slider(value: $step, in: 3...20, step: 1)
            
            ViewThatFits(in: .horizontal) {
                content
                ScrollView(.horizontal, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                    content
                })
            }
            .debugLog("VFT")
        }
        .frame(width: 300)
        .border(.red)
    }
    
    var content: some View {
        HStack {
            ForEach(0..<count, id: \.self) { i in
                Rectangle()
                    .fill(.orange.gradient)
                    .frame(width: 30, height: 30)
                    .overlay {
                        Text(i, format: .number)
                            .foregroundStyle(.white)
                    }
            }
        }
    }
}

#Preview {
    AdapativeScrolling()
}
