//
//  GeoReader.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 26/08/24.
//

import SwiftUI

struct GeoReader: View {
    var text: String
    @State private var overFlows = false
    
    var body: some View {
        Text(text)
            .fixedSize()
            .overlay {
                GeometryReader { proxy in
                    let toolong = proxy.size.width > 100
                    if #available(iOS 17.0, *) {
                        Color.clear
                        // called only once when the node is rendered
                            .onAppear(perform: {
                                overFlows = toolong
                            })
                        // this gets invoked when there is a change in this value.
                        // from being false to true then it's get triggered
                            .onChange(of: toolong) {
                                overFlows = toolong
                            }
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
            .frame(width: 100)
            .border(overFlows ? .red : .green)
    }
}

extension View {
    func onAppearOrChange<Value: Equatable>(of value: Value, perform: @escaping (Value) -> Void) -> some View {
        self
            .onAppear(perform: {
                perform(value)
            })
            .onChange(of: value, perform: perform)
    }
}

/*
 If we target iOS 17/macOS 14, there’s a new variant of onChange that takes an initial parameter, which indicates whether the perform closure should be called initially in addition to when the value changes:
 */

/*
 In many cases, this is the simplest solution to measure the size of a single view and propagate the measurement to an ancestor. However, when we need to measure multiple related views, using onAppear and onChange(of:) doesn’t scale very well. Instead, we can use preferences.
 */

#Preview {
    GeoReader(text: "Hello World!!")
}
