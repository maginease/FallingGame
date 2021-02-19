//
//  CollisionDetection.swift
//  movingTest
//
//  Created by Minseo Kim on 2/17/21.
//

import Foundation
import SpriteKit



class collidedWith:SKScene, SKPhysicsContactDelegate {
    
    func thunderCloud()->Bool {
        
        let contact = SKPhysicsContact()
        
        guard let node1 = contact.bodyA.node else { return false }
        guard let node2 = contact.bodyB.node else { return false }
        
        
        return (node1.name == "mainCharcter" && node2.name == "hostileCloud") || (node1.name == "hostileCloud" && node2.name == "mainCharacter")
        
    }
    
    func healthBottle() -> Bool {
        
        let contact = SKPhysicsContact()
        
        guard let node1 = contact.bodyA.node else { return false }
        guard let node2 = contact.bodyB.node else { return false }
        
        
        return (node1.name == "mainCharcter" && node2.name == "healthrestore") || (node1.name == "healthrestore" && node2.name == "mainCharacter")
       
    }
    
    
}





