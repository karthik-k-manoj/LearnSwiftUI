//
//  AspectRatio.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 19/07/24.
//

import SwiftUI


struct AspectRatio: View {
    var body: some View {
        Circle()
            .fill(Color.black)
            .aspectRatio(16/9, contentMode: .fit)
    }
}

struct AspectRatio_Previews: PreviewProvider {
    static var previews: some View {
        AspectRatio()
    }
}
