//
//  ViewThatFits3.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 07/09/24.
//

import SwiftUI

struct ViewThatFits3_1: View {
    @State var useIdealSize = false
    
    var body: some View {
        VStack {
            Button("Use Ideal Size") {
                useIdealSize.toggle()
            }
            
            Rectangle()
                .fill(.orange)
                .frame(width: 100, height: 100)
                .fixedSize(horizontal: useIdealSize ? true : false, vertical: useIdealSize ? true : false)
            
            Rectangle()
                .fill(.cyan)
                .frame(idealWidth: 100, idealHeight: 100)
                .fixedSize(horizontal: useIdealSize ? true : false, vertical: useIdealSize ? true : false)
            
            Rectangle()
                .fill(.green)
                .fixedSize(horizontal: useIdealSize ? true : false, vertical: useIdealSize ? true : false)
            
        }
        .animation(.easeInOut, value: useIdealSize)
    }
}

/*
 The difference between `.frame(width: 100, height: 100) and `.frame(idealWidth: 100, idealHeight: 100) is that former is considered as the views required size (ideal state or not) while the later onyl serves as the required size in the ideal state
 */

#Preview {
    ViewThatFits3_1()
}
