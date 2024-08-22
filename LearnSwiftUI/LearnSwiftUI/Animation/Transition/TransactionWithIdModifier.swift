//
//  TransactionWithIdModifier.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 22/08/24.
//

import SwiftUI

struct TransactionWithIdModifier: View {
    @State var id = UUID()
    
    var body: some View {
        VStack {
            Text("Hello \(UUID().uuidString)")
                .id(id)
                .transition(.opacity)
            Button("Update Id")
            {
                withAnimation(.easeInOut(duration: 3)) {
                    id = UUID()
                }
            }
            .transaction { transaction in
                transaction.animation = nil
            }
        }
    }
}

#Preview {
    TransactionWithIdModifier()
}
/*
Currently, SwiftUI’s logic for handling view transitions caused by changes in id values is not very consistent. If you encounter a transition that cannot be activated using animation (such as opacity), you can try using withAnimation.
*/
