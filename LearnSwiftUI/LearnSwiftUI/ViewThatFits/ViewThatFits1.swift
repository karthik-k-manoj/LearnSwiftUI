//
//  ViewThatFits1.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 06/09/24.
//

import SwiftUI

/*
 A view that adapts to the available space by providing the first child view that fits
 
 public struct ViewThatFits<Content: View>: View {
    public init(in axes: Axis.Set = [.horizontal, .vertical],
    @ViewBuilder content () -> Content)
 }

 ViewThatFits evaluates its child views in the order you provide them
 to the init. It selects the first child whose ideal size on the constrainted axes fits within the proposed size.
 Provide view in order of preference. Usually largest to smallest
 but since a view might fit along one constrainted axis but not the other this isn't always the case. By default ViewThatFits constrains in both horizontal and veritcal axes
 */

/*
 ViewThatFits Judgement and Presentation logic
 What is the criteria for judgement? What is the order of judgement? How it's ultimately presented?
 
 1) VTF needs to obtain the space it can use, proposed size provided by its parent view
 2) order of judgement is based on order in view builder closure from top to bottom, one by one for each subview
 3) VTF queries each subview for its ideal size (required size returned based on the unspecified proposed size)
 4) based on setting of constrainted axis on the selected constrained axis, the ideal size is compared with proposed size provided by parent of VTF
 5) if on all set constrained axes, the ideal size is less than or = to proposed size then subview is selected and judgement of sub subviews is stopped
 6) if none of the subview meets the condition then the last subview in the closure is selected
 7) VTF passes the proposed size provided by parent to selected subview as its own proposed size and obtains
    required size of that subview under the explicit proposed size
 8) VTF returns obtained required size as its own size to the parent view
 
 ------
 
 VTF will choose which subviews
    - available space for VTF (proposed size from parent view)
    - restricted axis set by VTF
    - ideal size of the subview on the restricted axis
    - order of arrangement of the subviews
 
 any change in these factor can result in different final outcome
 */

struct ViewThatFits1: View {
    var body: some View {
        ViewThatFits(in: .horizontal) {
            Text("Hello Beautiful World")
            Text("Hello World")
            Text("Hi")
        }
    }
}

/*


VTF selects first Text View within in closure that can be displayed without wrapping within given width

If above code placed in different context then selected subview varies
 
*/

/*
 100 width is checked with ideal width of first subview
 since it is greater, it moves to next subview
 it sees that this views ideal width is smaller than proposed width. So VTF proposed 100 to 2nd subview
 it returns the required size without wrapping to VTF.
 VTF infroms it's parent that as it's width
 */
struct ViewThatFits2: View {
    var body: some View {
        ViewThatFits(in: .horizontal) {
            Text("Hello Beautiful World")
            Text("Hello World")
            Text("Hi")
        }
        .border(.blue)
        .frame(width: 100)
        .border(.red)
    }
}


#Preview {
    ViewThatFits2()
}
