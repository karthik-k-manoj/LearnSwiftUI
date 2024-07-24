//
//  HStackWithZStack.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 24/07/24.
//

import SwiftUI

struct HStackWithZStack: View {
    var body: some View {
        HStack {
            Text("One")
                .debugLog("T1")
            ZStack {
                Text("Two")
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.purple)
                    .opacity(0.5)
                    .padding(-8)
            }
            .debugLog("Z")
            Text("Three")
                .debugLog("T2")
        }
        .frame(height: 200)
    }
}

struct HStackWithZStack_Previews: PreviewProvider {
    static var previews: some View {
        HStackWithZStack()
    }
}
