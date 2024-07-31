//
//  ContainerRelativeShaped.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 31/07/24.
//

import SwiftUI

struct ContainerRelativeShaped: View {
    var body: some View {
        ZStack {
            Color.black
            
            Image("bigImage")
                .resizable()
                // This view is wrapper around resizable which clips the child view using the `ContainerRelativeShape` which will take the shape of
                // it's container shape that is `RoundedRectangle()`
                .clipShape(ContainerRelativeShape())
        }
        .containerShape(RoundedRectangle(cornerRadius: 20))
        .frame(width: 100, height: 100)
    }
}

struct ContainerRelativeShaped_Previews: PreviewProvider {
    static var previews: some View {
        ContainerRelativeShaped()
    }
}
