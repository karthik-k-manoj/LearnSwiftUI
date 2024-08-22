//
//  TransactionUnderstanding.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 22/08/24.
//

import SwiftUI

struct TransactionUnderstanding: View {
    @State private var isActive: Bool = false
    @State private var scale = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isActive ? .green : .orange)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .animation(.smooth, value: isActive)
                .scaleEffect(scale ? 1.5 : 1.0)
                .animation(.bouncy(duration: 2), value: scale)
            
            Button("Change") {
                isActive.toggle()
                scale.toggle()
            }
        }
    }
}

#Preview {
    TransactionUnderstanding()
}
