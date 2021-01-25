//
//  gameElements.swift
//  movingTest
//
//  Created by Minseo Kim on 1/25/21.
//

import Foundation
import SpriteKit

extension GameScene {
    
    struct contactDelegate {
        
        static let thunderCloud:UInt32 = 0b00000001
        static let falling:UInt32 = 0b00000010
        
        
    }
    
    func collision() {
        
        mainCharacter.physicsBody?.categoryBitMask = contactDelegate.falling
        mainCharacter.physicsBody?.collisionBitMask = contactDelegate.thunderCloud
        
        hostileCloud.physicsBody?.categoryBitMask = contactDelegate.thunderCloud
        hostileCloud.physicsBody?.collisionBitMask = contactDelegate.falling
    }
    
    func hp()->SKLabelNode{
        let a = SKLabelNode()
        
        a.position = CGPoint(x: 160, y: 540)
        a.text = "\(totalHealth)"
        a.fontColor = SKColor.black
        addChild(a)
        
       return a
    }
}


