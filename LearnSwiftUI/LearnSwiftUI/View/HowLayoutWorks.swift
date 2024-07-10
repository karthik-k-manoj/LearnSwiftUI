//
//  ViewSize.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 10/07/24.
//

import SwiftUI

/* Parent view proposes a size to it's subview, subview determines it's own size based
 on the proposal and reports that size back to the parent. Parent then places it's subview
 within it's own coordinate system. Basically layout means to give each view a position and a size
 */

/*
 Proposed size type is `ProposedViewSize` and reported size could be `CGSize`
 */

/*
 But in SwiftUI after creating the view tree to rendering it on screen behavior isn't always
 straightforward. We need to undertand the alogrithm behind each view to really understand
 how the views are being rendered.
 */

struct HowLayoutWorks: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ViewSize_Previews: PreviewProvider {
    static var previews: some View {
        HowLayoutWorks()
    }
}
