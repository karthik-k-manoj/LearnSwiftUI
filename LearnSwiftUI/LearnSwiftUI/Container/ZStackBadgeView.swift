//
//  ZStackBadgeView.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 24/07/24.
//

import SwiftUI

struct ZStackBadgeView: View {
    var body: some View {
        HStack(alignment: .bottom) {
            overlayBadgeView
            zstackBadgeView
        }
        .border(Color.black)
        .frame(width: 400, height: 300)
    }
    
    
    var overlayBadgeView: some View {
        Text("Hello World")
            .font(.largeTitle)
            .overlay(alignment: .topTrailing) {
                Text("Overlay Badge")
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.yellow)
                            .padding(.all, -4)
                            .border(Color.black)
                    }
            }
    }
    
    var zstackBadgeView: some View {
        ZStack(alignment: .topTrailing) {
            Text("Hello World")
                .font(.largeTitle)
            badgeView
        }
    }
    
    var badgeView: some View {
        Text("ZStack Badge")
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.yellow)
                    .padding(-4)
                    .border(Color.black)
            }
    }
}

struct ZStackBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackBadgeView()
    }
}
