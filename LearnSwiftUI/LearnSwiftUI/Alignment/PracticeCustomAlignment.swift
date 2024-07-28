//
//  PracticeCustomAlignment.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 28/07/24.
//

import SwiftUI

extension HorizontalAlignment {
    private enum WeirdAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height
        }
    }
    
    static let weirdAlignment = HorizontalAlignment(WeirdAlignment.self)
}

struct PracticeCustomAlignment: View {
    var body: some View {
        VStack(alignment: .weirdAlignment, spacing: 10) {
            
            Rectangle()
                .fill(Color.primary)
                .frame(width: 1)
                .alignmentGuide(.weirdAlignment, computeValue: { d in d[.leading] })
            
            ColorLabel(label: "Monday", color: .red, height: 50)
            ColorLabel(label: "Tuesday", color: .orange, height: 70)
            ColorLabel(label: "Wednesday", color: .yellow, height: 90)
            ColorLabel(label: "Thursday", color: .green, height: 40)
            ColorLabel(label: "Friday", color: .blue, height: 70)
            ColorLabel(label: "Saturday", color: .purple, height: 40)
            ColorLabel(label: "Sunday", color: .pink, height: 40)
            
            Rectangle()
                .fill(Color.primary)
                .frame(width: 1)
                .alignmentGuide(.weirdAlignment, computeValue: { d in d[.leading] })
        }
        .border(.black)
    }
}

struct ColorLabel: View {
    let label: String
    let color: Color
    let height: CGFloat
    
    var body: some View {
        Text(label).font(.title).foregroundColor(.primary).frame(height: height).padding(.horizontal, 20)
            .background(RoundedRectangle(cornerRadius: 8).fill(color))
    }
}


struct PracticeCustomAlignment_Previews: PreviewProvider {
    static var previews: some View {
        PracticeCustomAlignment()
    }
}
