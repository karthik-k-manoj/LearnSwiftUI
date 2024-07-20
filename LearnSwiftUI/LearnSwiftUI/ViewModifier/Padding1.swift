//
//  Padding.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 20/07/24.
//

import SwiftUI

struct Padding1: View {
    var body: some View {
        /*
         below padding method adds 200 to top and bottom.
         subtracts 400 from the proposed hegith
         passes this new height (H - (400) to child view
         child returns say X
         padding returns X + 400
         */
        Color.blue
            .border(Color.black)
            .padding(.vertical, 200)
            .border(Color.red)
    }
}

struct Padding1_Previews: PreviewProvider {
    static var previews: some View {
        Padding1()
    }
}
