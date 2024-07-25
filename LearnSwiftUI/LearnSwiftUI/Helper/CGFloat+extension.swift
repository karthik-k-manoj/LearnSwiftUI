//
//  CGFloat+extension.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 25/07/24.
//

import SwiftUI

extension CGFloat {
    var pretty: String {
        String(format: "%.2f", self)
    }
}

extension CGSize {
    var pretty: String {
        "\(width.pretty) x \(height.pretty)"
    }
}

extension Optional where Wrapped == CGFloat {
    var pretty: String {
        self?.pretty ?? "nil"
    }
}

extension ProposedViewSize {
    var pretty: String {
        "\(width.pretty) x \(height.pretty)"
    }
}
