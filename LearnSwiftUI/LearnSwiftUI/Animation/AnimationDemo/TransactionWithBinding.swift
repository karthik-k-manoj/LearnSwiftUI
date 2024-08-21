//
//  TransactionWithBinding.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 21/08/24.
//

import SwiftUI
// We can set transaction for binding
struct TransactionWithBinding: View {
    @State private var animated = false
    let animation: Animation?
    
    var animatedBinding: Binding<Bool> {
        let transaction = Transaction(animation: animation)
        return $animated.transaction(transaction)
    }
    
    var body: some View {
        VStack {
            Text("Hi")
                .offset(x: animated ? 100 : 0)
                
            Toggle("Animated", isOn: animatedBinding)
        }
        .frame(width: 150, height: 500)
        .border(.red)
    }
}

#Preview {
    TransactionWithBinding(animation: .easeInOut)
}
