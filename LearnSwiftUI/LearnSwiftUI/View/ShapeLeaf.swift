//
//  ShapeLeaf.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 11/07/24.
//

import SwiftUI

/*
 Most built in shape accept any proposed size from zero to infinity and fill the available space.
 
 Circle is an exception. It will fit itself into any proposed size and report back the actual size of the circle. If we propise nil to a shape (i.e if we wrap it in a `.fixedSize`), it takes on a  default size of 10 X 10
 
 Along with built-in shapes we can also implement custom shapes. This is currently one of the few places in the SwiftUI where we can write own logic for computing the size based on the proposed size.
 */
struct ShapeLeaf: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ShapeLeaf_Previews: PreviewProvider {
    static var previews: some View {
        ShapeLeaf()
    }
}
