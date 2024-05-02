//
//  ContentView.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 02/05/24.
//

import SwiftUI

final class ReferenceType: ObservableObject {
    /* `@Published var value = 0` is just a syntatic sugar for the following code:
        var value = 0 {
            willSet {
                objectWillChange.send()
            }
        }
    */
    
    @Published var value: Int
    
    init(value: Int) {
        print("`ReferenceType` initialized.")
        self.value = value
    }
    
    deinit {
        print("`ReferenceType` deallocated.")
    }
}

// Child View
struct CounterView: View {
    /* `CounterView` node allocates and hold storage for model object which is handled by SwiftUI
        Why private? It ensures that you can't accidently set the parameter through a memberwise
        initializer of view, because doing so can conflict with the framework's storage management
        and produce unexpected result
    */
    @StateObject private var referenceType: ReferenceType
    
    /* `CounterView` may be initialized multiples but SwiftUI only initializes a state object
        the first time you call it's intializer in a given view. Also SwiftUI runs the
        autoclosure parameter to state object only the first time when state object is initialized
    */
    init() {
        print("`CounterView` initialized.")
        _referenceType = StateObject(wrappedValue: ReferenceType(value: 0))
    }
    
    var body: some View {
        Button("Tap to change child view state: \(referenceType.value)") {
            referenceType.value += 1
        }
    }
}

// Parent View
struct ContentView: View {
    @State private var parentViewState = 0
    
    var body: some View {
        Button("Tap to change parent view state: \(parentViewState)") {
            parentViewState += 1
        }
        Spacer()
        CounterView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
