//
//  ViewLife.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 12/09/24.
//

import SwiftUI

struct ViewLife: View {
    @State private var selection = 1
    
    var body: some View {
        ZStack {
            ShowMessage(text: "1")
                .opacity(selection == 1 ? 1 : 0)
            ShowMessage(text: "2")
                .opacity(selection == 2 ? 1 : 0)
            Button("Change") {
                selection = selection == 1 ? 2 : 1
            }
        }
    }
}

class LifeMonitor {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) init")
    }

    deinit {
        print("\(name) deinit")
    }
}

struct ShowMessage: View {
    let text: String
    let lifeMonitor: LifeMonitor
    
    init(text: String) {
        self.text = text
        self.lifeMonitor = LifeMonitor(name: text)
    }
    
    var body: some View {
        Text(text)
    }
}

#Preview {
    ViewLife()
}
