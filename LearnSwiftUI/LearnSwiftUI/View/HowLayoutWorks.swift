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

 // Proposed size type is `ProposedViewSize` and reported size is `CGSize`

/*
 But in SwiftUI after creating the view tree to rendering it on screen behavior isn't always
 straightforward. We need to undertand the alogrithm behind each view to really understand
 how the views are being rendered.
 */

/*
 First thing to keep in mind is that SwiftUI's layout algroithm proceeds top-down along the view tree.
 */

struct HowLayoutWorks: View {
    var body: some View {
        /*
         VStack is the root view. It will receive safe screen area as the proposed size
         To determine its own size, stack first recursively proposes sizes to the subview.
         Image will report its size based on the globe symbol. Text will report its size based
         on the proposed size and string it has to render.
         
         We can consider the layout process to be 2 part step. In the first step the parent view
         will ask it's subview for it's size. This process is repeated if it subview has its own
         subview. For example once we reach the leaf view it returns it's size ending the recursion
         thereby each view can return its size based on the size of it's subview.
         
         In the second step the root view will place the subviews in its own coordinate system.
         this is repeated until we reach the leaf view which actually renders the content.
         
         Note that size reported by the subview is the definite size of the subview. The parent
         cannot alter this size unilaterally. It could go back to step2 and make another proposal
         but at the end of the day subview determines its size taking the proposal into account
         
         While the API involed in this process isn't part of the `public View`. Below are the two
         method that every view has (This is part of `Layout` protocol which was introduced in iOS 16)
         
         func sizeThatFits(
            proposal: ProposedViewSize,
            subviews: Subviews,
            cache: inout ()
         ) -> CGSize { }
         
         func placeSubviews(
             in bounds: CGRect,
             proposal: ProposedViewSize,
             subviews: Subviews,
             cache: inout ()
         ) { }
         
         
         struct ProposedViewSize { var width, height: CGFloat? }
         
         Difference between CGSize and ProposedSize is that both components are optional in
         `ProposedSize`
         
         Proposing nil for a component means that the view can become it's ideal size in that
         dimension. The ideal size is different for each view.
         */
        
        /*
         Let try to understand how sizes are proposed and reported here.
         
         1) VStack is proposed a safe area size (X, Y) by the window
         2) VStack needs to calculate it's size by considering the proposed size
         3) It divides the proposed size by number of subviews and proposes (Y / 3) to it's subview
         4) Some views might even disregard the proposed size such as `Image` does so by default.
            while other views return the proposed size as their actual size. We say that it accepts
            the proposed size
         5) Here each subview returns a size (reported) and VStack unions them to report it's size
            to the parent window.
         6) Parent places the subviews according it's own alignment and the alignment guide of the subview
         */
        
        /*
         In general when trying to understand how views are lait out, it is best to put a
         border on the view. In addition we could add an overlay with a geometry reader to
         also render the size of the view but border already helps debug almost every layout problem
         
         Basically `border` internally is a call to `overlay` with shape (shape always accepts proposed size)
         */
        VStack {
            Image(systemName: "globe")
            Text("Hello World")
            Rectangle()
        }
    }
}

struct ViewSize_Previews: PreviewProvider {
    static var previews: some View {
        HowLayoutWorks()
    }
}

