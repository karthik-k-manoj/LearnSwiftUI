//
//  LearnViewModifier2.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 20/07/24.
//

import SwiftUI

struct LearnViewModifier2: View {
    var body: some View {
        Color.blue
            .frame(width: 300, height: 300)
            .watermarked(with: "Hacking With Swift")
    }
}

struct LearnViewModifier2_Previews: PreviewProvider {
    static var previews: some View {
        LearnViewModifier2()
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct WaterMark: ViewModifier {
    let text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(Rectangle())
    }
}
