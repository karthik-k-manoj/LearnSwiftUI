//
//  PlaySound.swift
//  LearnSwiftUI
//
//  Created by Karthik K Manoj on 03/08/24.
//

import AVFoundation

final class AudioPlayer {
    static let shared = AudioPlayer()
    
    private var audioPlayer: AVAudioPlayer?

    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Could not find and play the sound file")
            }
        }
    }
    
    func stop() {
        audioPlayer?.stop()
    }
}

