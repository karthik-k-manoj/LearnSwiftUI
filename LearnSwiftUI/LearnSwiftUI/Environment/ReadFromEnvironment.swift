//
//  ReadFromEnvironment.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 30/07/24.
//

import SwiftUI

struct ReadFromEnvironment: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    var body: some View {
        HStack {
            Text("Hello")

            if dynamicTypeSize < .large {
                Image(systemName: "hand.wave")
            }
        }
    }
}

struct ReadFromEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        ReadFromEnvironment()
    }
}
