//
//  BreathingAppView.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 03/08/24.
//

import SwiftUI

struct BreathingAppView: View {
    @State var scaleUpDown = false
    @State var rotateInOut = false
    @State var moveInOut = false
    
    var body: some View {
        ZStack {
         Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct BreathingAppView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingAppView()
    }
}
