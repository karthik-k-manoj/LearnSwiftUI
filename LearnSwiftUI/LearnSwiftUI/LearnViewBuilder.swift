//
//  LearnViewBuilder.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 06/07/24.
//

import SwiftUI

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
    func type() -> Self {
       print("Type: \(Swift.type(of: self))")
       return self
    }
}

struct LearnViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        LearnViewBuilder()
    }
}
