//
//  RecordPlayerMainView.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 03/08/24.
//

import SwiftUI

struct RecordPlayerMainView: View {
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.white, .black]), center: .center, startRadius: 20, endRadius: 600)
                .scaleEffect(1.2)
            // or use `.ignoreSageArea` 
            
            RecordPlayerBox()
            
            RecordButtonArmView(audioPlayer: AudioPlayer.shared)
        }
    }
}

struct RecordPlayerMainView_Previews: PreviewProvider {
    static var previews: some View {
        RecordPlayerMainView()
    }
}
