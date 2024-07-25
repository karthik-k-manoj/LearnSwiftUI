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
        var label: String
        var value: String
    }
    
    static let shared = Console()
}

func log(_ label: String, value: String) {
    Console.shared.log.append(Console.Item(label: label, value: value))
}
