//
//  Audio.swift
//  movingTest
//
//  Created by Minseo Kim on 3/11/21.
//

import Foundation
import AVFoundation

var audio:AVAudioPlayer?

func playSound(sound:String, type:String) {
    
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        
        do {
            audio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audio?.play()
        } catch { print("") }
        
    }
    
}
