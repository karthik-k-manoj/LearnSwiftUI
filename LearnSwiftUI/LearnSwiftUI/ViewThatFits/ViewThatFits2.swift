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


// This constraint of ideal size on a single axis
// corresponds exactly to the restricted axes setting in
// VFT initializer.


struct IdealSizeText: View {
    var body: some View {
        Text("GeometryReader has been present since the birth of SwiftUI, playing a crucial role in many scenarios.")
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .border(Color.blue)
            .frame(width: 100, height: 100)
            .border(.red)
    }
}

/*
 Now understand there is a relationship between fixedSize (proposing nil x nil) with the constrainted axes inside `ViewThatFits` initializer
 Through config we can make VFT only
 evaluate child view's ideals izes on certain axes
 
 Below VTF says I need to only consider `.vertical` axis. This means
 To decide which view to be selected VTF proposed width X nil for each view
 So depending on this combination text shrinks as there is a width and the height of the text will go beyond the proposed height of VTF parent.
 
 Developers must be clear that VFT makes judgement based on ideal sizes but the selected child view is not rendered in it's ideal state during the display. So if the proposed size is less then subview has to to truncate the text according to the default display rules during final rendering
 
 */

struct IdealSizeText3: View {
    var body: some View {
        HStack {
            ViewThatFits(in: .vertical) {
                Text("1: GeometryReader has been present since the birth of SwiftUI, playing a crucial role in many scenarios.")
                                Text("2: In addition, some views believe that:")
            }
            .border(.blue)
            .frame(width: 200, height: 100, alignment: .top)
            .border(.red)
            
            Text("1: GeometryReader has been present since the birth of SwiftUI, playing a crucial role in many scenarios.")
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .border(.blue)
                .frame(width: 200, height: 100, alignment: .top)
                .border(.red)
            
            Text("2: In addition, some views believe that:")
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .border(.blue)
                .frame(width: 200, height: 100, alignment: .top)
                .border(.red)
        }
    }
}


#Preview {
    IdealSizeText3()
}
