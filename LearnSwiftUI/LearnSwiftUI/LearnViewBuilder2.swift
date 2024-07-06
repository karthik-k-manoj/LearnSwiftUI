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
            
            HStack(spacing: 20) {
                // Type is ModifiedContent<Hello, _OverlayModifier>
                // This applies border modifier to each views in the list view
                Hello()
                    .border(.blue)
                    .type()
            }
            
            HStack(spacing: 20) {
                // Type is ModifiedContent<Image, _OverlayModifier>
                Image(systemName: "hand.wave")
                    .border(.blue)
                    .type()
                // Type is ModifiedContent<Text, _OverlayModifier>
                Text("Hello World")
                    .border(.blue)
                    .type()
            }
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
