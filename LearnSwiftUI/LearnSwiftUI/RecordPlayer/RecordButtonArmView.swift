//
//  RecordButtonArmView.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 03/08/24.
//

import SwiftUI

struct RecordButtonArmView: View {
    // State variables
    @State private var rotateRecord = false
    @State private var moveArm = false
    @State private var duration = 0.0
    
    let audioPlayer: AudioPlayer
    
    var animationForever: Animation {
        Animation.linear(duration: duration)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        ZStack {
            Image("record")
                .resizable()
                .frame(width: 280, height: 280)
                .rotationEffect(Angle(degrees: rotateRecord ? 360 : 0))
                .animation(animationForever.delay(1.5), value: rotateRecord)
            
            Image("playerArm")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                .rotationEffect(Angle.degrees(-35), anchor: .topTrailing)
                .rotationEffect(Angle.degrees(moveArm ? 8 : 0), anchor: .topTrailing)
                .animation(Animation.linear(duration: 2), value: moveArm)
                .offset(x: 75, y: -30)
            
            button
                .offset(x: -105, y: 135)
        }
    }
    
    var button: some View {
        Button {
           
            rotateRecord.toggle()
            if rotateRecord {
                audioPlayer.playSound(sound: "music", type: "m4a")
                duration = 0.8
                moveArm = true
            } else {
                duration = 0.0
                moveArm = false
                audioPlayer.stop()
            }
        } label: {
            HStack {
                if !rotateRecord {
                    Text("Play")
                        .bold()
                        .foregroundColor(.black)
                    Image(systemName: "play.circle.fill")
                        .foregroundColor(.black)
                } else {
                    Text("Stop")
                        .bold()
                        .foregroundColor(.red)
                    Image("stop.fill")
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Capsule().strokeBorder(Color.black, lineWidth: 2.00))
        }
    }
}

struct RecordButtonArmView_Previews: PreviewProvider {
    static var previews: some View {
        RecordButtonArmView(audioPlayer: AudioPlayer())
            .previewLayout(.sizeThatFits).padding()
    }
}
