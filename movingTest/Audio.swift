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



func returnSound(sound:String, type:String)->AVAudioPlayer? {
    
    var audio:AVAudioPlayer?
    
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        
        do {
            audio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
        } catch { print("Unknown Error") }
        
    }
    
    return audio
}

// let BGM1 =  returnSound(sound: "BGM1", type: "mp3")
// let BGM2 =  returnSound(sound: "BGM2", type: "mp3")
// let BGM3 =  returnSound(sound: "BGM3", type: "mp3")
// let BGM4 =  returnSound(sound: "BGM4", type: "mp3")

func Bgm(_ value:Int) ->AVAudioPlayer? {
    
    switch value {
    
    case 1:
        return returnSound(sound: "BGM1", type: "mp3")
    case 2:
        return returnSound(sound: "BGM2", type: "mp3")
    case 3:
        return returnSound(sound: "BGM3", type: "mp3")
    case 4:
        return returnSound(sound: "BGM4", type: "mp3")
    default:
        return nil
        
    }
    
    
}


func playBgmRandomly()->AVAudioPlayer {
    
    var playArray = [1,2,3,4]
    
    var itemIndex = 4
    
    if paused == false {
        
        if itemIndex > 0 {
        
        let randomIndex = Int.random(in: 0...(itemIndex - 1))
       
            Bgm(playArray[randomIndex])!.volume = 0.3
            Bgm(playArray[randomIndex])!.play()
            
            playArray.remove(at: randomIndex)
        
        itemIndex -= 1
            
        } else { itemIndex = 4; playArray = [1,2,3,4]; }
        
   
    }
    return Bgm(1)!
}

func randomize<T>(_ targetArray:[T])->[T] {
    
    var index = targetArray.count
    
    var result = [T]()
    
    var array = targetArray
    
    for _ in 1...targetArray.count {
        
        let randomIndex = Int.random(in: 0...index - 1)
        
        result.append(array[randomIndex])
        
        array.remove(at: randomIndex)
        
        index -= 1
    }
    
    
    return result
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




