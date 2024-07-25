//
//  ConsoleView.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 25/07/24.
//

import SwiftUI

struct ConsoleView: View {
    @ObservedObject var console = Console.shared
    
    var body: some View {
        List(console.log) { item in
            HStack {
                Text(item.label)
                    .frame(width: 100)
                Spacer()
                Text(item.value)
            }
        }
        .listStyle(.plain)
        .frame(maxHeight: 500)
    }
}

struct ConsoleView_Previews: PreviewProvider {
    static var previews: some View {
        ConsoleView()
    }
}
