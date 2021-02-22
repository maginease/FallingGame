//
//  createCharacterProtocol.swift
//  movingTest
//
//  Created by Minseo Kim on 2/7/21.
//

import Foundation
import SpriteKit

protocol createCharacter:SKScene {
    
    var timeToGoUp:Int { get }
    
   
    
}


extension createCharacter {
    
    
   
    func levitateAndRemove (xSpeed: Bool) -> SKAction {
        
        
        if xSpeed == true {
            
           
            let movingUp = SKAction.moveBy(x: CGFloat(Int.random(in: -Int(self.frame.width * 1 / 5)...Int(self.frame.width * 1 / 5))), y: self.frame.height, duration: TimeInterval(timeToGoUp))
            
            let remove = SKAction.removeFromParent()
            
            let sequence = SKAction.sequence([movingUp,remove])
            
                return sequence
          
            }
            
        
        
        let movingUp = SKAction.moveBy(x: 0, y: self.frame.height, duration: TimeInterval(timeToGoUp))
        
        let remove = SKAction.removeFromParent()
        
        let sequence = SKAction.sequence([movingUp,remove])
        
        return sequence
       
    }

}







