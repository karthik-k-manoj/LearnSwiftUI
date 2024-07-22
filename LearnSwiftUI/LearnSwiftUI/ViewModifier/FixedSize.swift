//
//  FixedSize.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 22/07/24.
//

import SwiftUI

struct FixedSize: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .fixedSize()
            .frame(width: 25, height: 50)
            .clipped()
            .border(Color.red)
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .fixedSize()
            .frame(width: 50, height: 50)
            .border(Color.red)
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .fixedSize()
            .frame(width: 100, height: 100)
            .border(Color.red)
            .clipped()
    }
}

struct FixedSize_Previews: PreviewProvider {
    static var previews: some View {
        FixedSize()
    }
}
