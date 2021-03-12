//
//  Audio.swift
//  movingTest
//
//  Created by Minseo Kim on 3/11/21.
//

import Foundation
import AVFoundation
import SpriteKit

var audio:AVAudioPlayer?

func playSound(sound:String, type:String) {
    
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        
        do {
            audio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audio?.play()
        } catch { print("Unknown Error") }
        
    }
    
}


//func playBGM() { playSound(sound: "background", type: "mp3") }
//let PlayBgm = SKAction.run(playBGM)
//let repeatBgmForever = SKAction.repeatForever(PlayBgm)

func playBGM1() { playSound(sound: "B1", type: "m4a")}
let PlayBGM1 = SKAction.run(playBGM1)

func playBGM2() { playSound(sound: "B2", type: "m4a")}
let PlayBGM2 = SKAction.run(playBGM2)

func playBGM3() { playSound(sound: "B3", type: "m4a")}
let PlayBGM3 = SKAction.run(playBGM3)


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



var randomBGM = randomizeBGM([PlayBGM1,PlayBGM2,PlayBGM3])


class BGM_Randomizer {
    
    var BGMCount = 3
    var array:[SKAction]
    
    init() {
        
        var properArray = [PlayBGM1,PlayBGM2,PlayBGM3]
        var arrayApended = [SKAction]()
        var index = BGMCount
        
        for _ in 1...BGMCount {
            
            let randomIndex = Int.random(in: 0...index - 1)
            
            arrayApended.append(properArray[randomIndex])
            
            properArray.remove(at: randomIndex)
            
            index -= 1
            
        }
        
        array = arrayApended
    }
   
    
    
}
