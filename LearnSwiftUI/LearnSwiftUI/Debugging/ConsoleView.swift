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
                    .font(.subheadline)

                Spacer()
                Text(item.value)
                    .font(.subheadline)
            }
        }
        .listStyle(.plain)
        .frame(maxHeight: 400)
    }
}

struct ConsoleView_Previews: PreviewProvider {
    static var previews: some View {
        ConsoleView()
    }
}
