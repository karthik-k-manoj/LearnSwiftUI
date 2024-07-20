//
//  Padding2.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 20/07/24.
//

import SwiftUI

struct Padding2: View {
    var body: some View {
        Color.black
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .border(Color.red)
            .frame(width: 300)
    }
}

struct Padding2_Previews: PreviewProvider {
    static var previews: some View {
        Padding2()
    }
}
