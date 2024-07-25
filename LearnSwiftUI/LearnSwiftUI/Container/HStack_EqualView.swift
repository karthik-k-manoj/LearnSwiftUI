//
//  HStack_EqualView.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 24/07/24.
//

import SwiftUI

struct HStack_EqualView: View {
    var body: some View {
        /*
         HStack so take the available width
         since only one group, divide by the remaining elements
         propose that width get the width
         subtract if from available and propose it to the second
         (consider subtracing spacing initially)
        
         this stored in HStack and while rendering it is used again
         */
        VStack {
            HStack {
                Text("Forecast")
                    .padding()
                    .frame(maxHeight: .infinity)
                    .debugLog("Flexi Frame R")
                    .background(Color.red)
                    .debugLog("Background R")
                
                Text("The rain in Spain falls mainly on the Spainards")
                    .padding()
                    .frame(maxHeight: .infinity)
                    .debugLog("Flexi Frame Y")
                    .background(Color.yellow)
                    .debugLog("Background Y")
            }
            .fixedSize(horizontal: false, vertical: true)
            .border(.black)
            
            ConsoleView()
        }
     
    }
}

struct HStack_EqualView_Previews: PreviewProvider {
    static var previews: some View {
        HStack_EqualView()
    }
}
