//
//  LearnViewBuilder2.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 06/07/24.
//

import SwiftUI

struct LearnViewBuilder2: View {
    var body: some View {
        VStack(spacing: 20) {
            // HStack subviews are `TupleView<(TupleView<(Image, Text)>, TupleView<(Image, Text)>)>
            HStack(spacing: 20) {
                hello
                bye
            }
            
            // HStack subviews are `TupleView<(TupleView<(Image, Text)>, TupleView<(Image, Text)>)>
            // This works because `Hello` and `Bye` have `body` property which itself is a view list
            HStack(spacing: 20) {
                Hello()
                Bye()
            }
            
            // HStack subviews are TupleView<(Image, Text, Image, Text)>
            HStack(spacing: 20) {
                Image(systemName: "hand.wave")
                Text("Hello World")
                Image(systemName: "hand.wave")
                Text("Good Bye")
            }
            
            // UI are the same. How?
            /*
             This is a special property of view lists: when a container view like the HStack iterates over the view list,
             nested lists are recursively unfolded so that a tree of tuple views turns into a flat list of views.
             */
        }
    }
    
    struct Hello: View {
        var body: some View {
            Image(systemName: "hand.wave")
            Text("Hello World")
        }
    }
    
    struct Bye: View {
        var body: some View {
            Image(systemName: "hand.wave")
            Text("Good Bye")
        }
    }
    
    @ViewBuilder var hello: some View {
        Image(systemName: "hand.wave")
        Text("Hello World")
    }
    
    @ViewBuilder var bye: some View {
        Image(systemName: "hand.wave")
        Text("Good Bye")
    }
}

struct LearnViewBuilder2_Previews: PreviewProvider {
    static var previews: some View {
        LearnViewBuilder2()
    }
}
