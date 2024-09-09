//
//  AdaptiveHorizontalAndVerticalLayout.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 09/09/24.
//

import SwiftUI

struct AdaptiveHorizontalAndVerticalLayout: View {
    @State var width: CGFloat = 100
    
    var logo: some View {
        Rectangle()
            .fill(.orange)
            .frame(idealWidth: 100, maxWidth: 200)
            .overlay {
                Image(systemName: "heart.fill")
                    .font(.title)
                    .foregroundStyle(.white)
            }
    }
    
    var title: some View {
        Text("Hello World")
            .fixedSize()
            .font(.headline).bold()
            .frame(maxWidth: 120)
    }
    var body: some View {
        VStack {
            ViewThatFits(in: .horizontal) {
                HStack(spacing: 0) {
                    logo
                    title
                }
                
                VStack(spacing: 0) {
                    logo
                    title
                }
            }
            // 100 is what is proposed but
            // to which it has to propose first
            // the equal depends on the flexibility
            .frame(maxWidth: width, maxHeight: 130)
            .border(.red)
            Spacer()
            Slider(value: $width, in: 90 ... 250)
                .padding(50)
        }
    }
}

#Preview {
    AdaptiveHorizontalAndVerticalLayout()
}
