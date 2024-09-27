//
//  CollectionViewFlowLayoutUsingPreference.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 27/09/24.
//

import SwiftUI

struct CollectionViewFlowLayoutUsingPreference: View {
    var strings = (1...10).map {
        "Item \($0)" + String(repeatElement("x", count: Int.random(in: 0...10)))
    }
    
    var body: some View {
        HStack {
            ForEach(strings, id: \.self) { string in
                Text(string)
                    .padding(10)
                    .background {
                        Color.red
                    }
            }
        }
    }
}

#Preview {
    CollectionViewFlowLayoutUsingPreference()
}
