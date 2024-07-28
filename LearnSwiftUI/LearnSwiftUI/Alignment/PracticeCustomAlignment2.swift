//
//  PracticeCustomAlignment2.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 28/07/24.
//

import SwiftUI

struct MyCenterAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context.height
    }
}

extension VerticalAlignment {
    static let myCenterAlignment = VerticalAlignment(MyCenterAlignment.self)
}

struct PracticeCustomAlignment2: View {
    @State private var selectedIdx = 0
    
    var days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"]
    
    var body: some View {
        HStack(alignment: .myCenterAlignment) {
            Image(systemName: "checkmark.seal")
                .alignmentGuide(.myCenterAlignment) { dim in
                    dim[VerticalAlignment.center]
                }
            daysVStack
        }
       
    }
    
    var daysVStack: some View {
        VStack {
            ForEach(days.indices, id: \.self) { idx in
                if selectedIdx == idx {
                    Text("\(days[idx])")
                        .padding()
                        .border(.red)
                } else {
                    Text("\(days[idx])")
                        .padding()
                        .border(.red)
                }
            }
        }
    }
}

struct PracticeCustomAlignment2_Previews: PreviewProvider {
    static var previews: some View {
        PracticeCustomAlignment2()
    }
}
