//
//  Console.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 25/07/24.
//

import SwiftUI

final class Console: ObservableObject {
    @Published var log: [Item] = []
    
    struct Item: Identifiable {
        var id = UUID()
        var text: String
    }
    
    static let shared = Console()
}

func log(_ text: String) {
    Console.shared.log.append(Console.Item(text: text))
}
