//
//  LearnViewBuilder.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 06/07/24.
//

import SwiftUI

/*
 In a view builder we can maximum of 10 views. There are `buildBlock` methods defined for only 10 views.
 */
struct LearnViewBuilder: View {
    var body: some View {
       hello
            .type()
            .frame(width: 100)
        Button("Get body type view") {
            print("Type: \(Swift.type(of: self.body))")
        }
        bye
            .type()
            .frame(width: 100)
        hello
        hello
        hello
        hello
        hello
        hello
        hello
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

extension View {
    func type(_ context: String = "") -> Self {
       print("Type \(context): \(Swift.type(of: self))")
       return self
    }
}

struct LearnViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        LearnViewBuilder()
    }
}
