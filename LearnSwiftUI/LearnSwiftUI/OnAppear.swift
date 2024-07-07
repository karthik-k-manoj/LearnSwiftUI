//
//  OnAppear.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 06/07/24.
//

import SwiftUI

struct OnAppear: View {
    var value: Int?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                // This is called when the Text is rendered on screen for the first time.
                print("Hello World appeared")
            }
            // Since we gave an explicit id on change of this id `onAppear` will be triggered again.
            .id(value)
        Text("Hello World 2")
            .onAppear {
                print("Hello World 2 appeared")
            }
    }
}

struct ParentView: View {
    @State var value = 0
    
    var body: some View {
        OnAppear(value: value)
        Button("Change State") {
            value += 1
        }
    }
}

struct OnAppear_Previews: PreviewProvider {
    static var previews: some View {
        OnAppear(value: 0)
    }
}
