//
//  PracticeAlignment4.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 27/07/24.
//

import SwiftUI

struct PracticeAlignment4: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .background(Color.teal)
            .badge {
                Circle()
                    .fill(.orange)
                    .frame(width: 20, height: 20)
            }
    }
}

struct PracticeAlignment4_Previews: PreviewProvider {
    static var previews: some View {
        PracticeAlignment4()
    }
}
