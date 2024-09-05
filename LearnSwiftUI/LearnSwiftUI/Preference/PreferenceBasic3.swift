//
//  PreferenceBasic3.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 05/09/24.
//

import SwiftUI

struct CustomTitleKey: PreferenceKey {
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
       value = nextValue()
    }
}

struct CustomNavigationView<Content: View>: View {
    @State private var title: String?
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            Text(title ?? "")
                .font(.largeTitle)
            content
        }
       // .preference(key: CustomTitleKey.self, value: "Hi")
        .onPreferenceChange(CustomTitleKey.self, perform: { value in
            title = value
        })
    }
}

struct PreferenceBasic3: View {
    var body: some View {
        CustomNavigationView {
            VStack {
                Text("Hello World")
                    .preference(key: CustomTitleKey.self, value: "My Custom Title")
                Text("This is a custom navigation view")
            }
            .preference(key: CustomTitleKey.self, value: "My Custom Title")
        }
    }
}

#Preview {
    PreferenceBasic3()
}
