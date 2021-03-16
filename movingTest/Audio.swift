//
//  Audio.swift
//  movingTest
//
//  Created by Minseo Kim on 3/11/21.
//

import Foundation
import AVFoundation
import SpriteKit
import AVKit

var audio:AVAudioPlayer?

func playSound(sound:String, type:String) {
    
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        
        do {
            audio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audio?.play()
        } catch { print("Unknown Error") }
        
    }
    
}



class BGM:SKScene {
  
    let PlayBGM1 = SKAction.playSoundFileNamed("BGM1.mp3", waitForCompletion: true)

    let PlayBGM2 = SKAction.playSoundFileNamed("BGM2.mp3", waitForCompletion: true)

    let PlayBGM3 = SKAction.playSoundFileNamed("BGM3.mp3", waitForCompletion: true)

    let PlayBGM4 = SKAction.playSoundFileNamed("BGM4.mp3", waitForCompletion: true)



    func randomizeBGM(_ targetArray:[SKAction])->[SKAction] {
        
        var index = targetArray.count
        
        var result = [SKAction]()
        
        var array = targetArray
        
        for _ in 1...targetArray.count {
            
            let randomIndex = Int.random(in: 0...index - 1)
            
            result.append(array[randomIndex])
            
            array.remove(at: randomIndex)
            
            index -= 1
        }
        
        
        return result
    }



}




