//
//  PracticeCustomAlignment2.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 28/07/24.
//

import SwiftUI

struct PracticeCustomAlignment2: View {
    
    var days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"]
    
    var body: some View {
       daysVStack
    }
    
    var daysVStack: some View {
        VStack {
            ForEach(days.indices, id: \.self) { idx in
                Text("\(days[idx])")
                    .padding(4)
                    .border(.red)
            }
        }
    }
}

struct PracticeCustomAlignment2_Previews: PreviewProvider {
    static var previews: some View {
        PracticeCustomAlignment2()
    }
}
