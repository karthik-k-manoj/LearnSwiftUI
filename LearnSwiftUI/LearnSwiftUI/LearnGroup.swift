//
//  LearnGroup.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 06/07/24.
//

import SwiftUI

struct LearnGroup: View {
    @State private var layoutVertically = false
    
    var body: some View {
        Button {
            layoutVertically.toggle()
        } label: {
            if layoutVertically {
                VStack {
                    UserView(isVertical: 1, type: "VStack")
                }
            } else {
                HStack {
                    UserView(isVertical: 2, type: "HStack")
                }
            }
        }
    }
}

struct LearnGroup_Previews: PreviewProvider {
    static var previews: some View {
        LearnGroup()
    }
}

// Since UserView has a Group it's layout if either vertically or horizontally is defined how parent places `UserView`.
struct UserView: View {
    @State var isVertical = 0
    
    init(isVertical: Int, type: String) {
        self._isVertical = State(initialValue: isVertical)
    }
    
    var body: some View {
        Button("Update State \(isVertical)") {
            isVertical += 1
        }
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}
