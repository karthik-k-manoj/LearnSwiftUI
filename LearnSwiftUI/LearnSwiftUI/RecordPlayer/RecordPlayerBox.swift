//
//  RecordPlayerBox.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 03/08/24.
//

import SwiftUI

struct RecordPlayerBox: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 345, height: 345)
                .cornerRadius(10)
            Image("woodGrain")
                .resizable()
                .frame(width: 325, height: 325)
                .shadow(color: .white, radius: 3, x: 0, y: 0)
        }
    }
}

struct RecordPlayerBoxV_Previews: PreviewProvider {
    static var previews: some View {
        RecordPlayerBox()
    }
}
