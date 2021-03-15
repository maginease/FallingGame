//
//  entityClass.swift
//  movingTest
//
//  Created by Minseo Kim on 2/17/21.
//

import Foundation
import SpriteKit
import AVFoundation

class hostileCloud: SKScene, createCharacterScene {
   
  
    var timeToGoUp = 3.0
   
    override init(size: CGSize) {
       
       super.init(size: size)
   }
 
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   
   
   func createHostileCloud() -> SKNode {
      
       let Entity = SKSpriteNode(imageNamed: "thundercloud-hostile")
    
    physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
    Entity.anchorPoint = CGPoint(x: 0, y: 0)
       
    Entity.physicsBody?.affectedByGravity = false
        Entity.physicsBody?.isDynamic = false
        
        Entity.size = CGSize(width: self.frame.width / 6, height: self.frame.height / 12)
    Entity.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width / 20, height: self.frame.height / 40))
    
    Entity.physicsBody?.contactTestBitMask = category.mainCharacterCategory
    Entity.physicsBody?.categoryBitMask = category.hostileCloudCategory
    

    Entity.position = CGPoint(x: Int.random(in: 0...(Int(self.frame.width) - Int(Entity.size.width))), y: 1)
        Entity.name = "hostileCloud"
        Entity.zPosition = 0
        Entity.physicsBody?.restitution = 0
        Entity.zRotation = 0
    

    if paused == false {
        Entity.run(levitateAndRemove(xSpeed: false))

    return Entity
      
    }
    let EmptyNode = SKSpriteNode()
    
    return EmptyNode
   }
    
}
    

class cloud: SKScene, createCharacterScene {
        
    var timeToGoUp = 10.0
        
        func createCloud()-> SKNode {
            
            let Entity = SKSpriteNode(imageNamed: "cloud")
            
            Entity.physicsBody?.affectedByGravity = false
            Entity.physicsBody?.isDynamic = false
            Entity.zPosition = -1
            
            Entity.position = CGPoint(x: Int.random(in: 0...Int(self.frame.size.width)), y: -1)
            Entity.size = CGSize(width: self.frame.width/2, height: self.frame.size.height/5)
           
            if paused == false {
            
                Entity.run(levitateAndRemove(xSpeed: false))
            
            return Entity
        }
            let EmptyNode = SKSpriteNode()
            
            return EmptyNode
        }
  
}
   

class bomb:SKScene, createCharacterScene {
    
    var timeToGoUp = 4.0
    
    func createBomb() ->SKNode {
        
        let bomb = SKSpriteNode(imageNamed: "bomb")
        
        bomb.physicsBody?.isDynamic = false
        bomb.physicsBody?.affectedByGravity = false
        bomb.name = "bomb"
        
        bomb.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width/10, height: self.frame.size.height/30))
        bomb.size = CGSize(width: self.frame.width / 2, height: self.frame.height * 3 / 5)
        bomb.position = CGPoint(x: Int.random(in: 0...(Int(self.frame.size.width)) - Int(bomb.size.width)), y: 1)
        bomb.physicsBody?.allowsRotation = false
        bomb.physicsBody?.restitution = 0
        bomb.zPosition = 1
        
        bomb.physicsBody?.collisionBitMask = category.mainCharacterCategory
        bomb.physicsBody?.contactTestBitMask = category.mainCharacterCategory
        bomb.physicsBody?.categoryBitMask = category.bombCategory
        
        if paused == false {
        
            bomb.run(levitateAndRemove(xSpeed: false))
        
        return bomb
    }
        
        let EmptyNode = SKSpriteNode()
        
        return EmptyNode
    }
    
    
   
    
    
}

class healthBottle: SKScene, createCharacterScene {
    
    var timeToGoUp = 4.0
    
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createHealthBottle() -> SKNode {
       
        let healthRegnerator = SKSpriteNode(imageNamed: "healthrestore")
       
        healthRegnerator.anchorPoint = CGPoint(x: 0, y: 0)
        healthRegnerator.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width/20, height: self.frame.height/30))
        healthRegnerator.physicsBody?.affectedByGravity = false
        healthRegnerator.physicsBody?.isDynamic = false
        healthRegnerator.position = CGPoint(x: Int.random(in: Int(self.frame.width * 1 /  5)...Int(self.frame.width * 4 / 5)), y: 0)
        healthRegnerator.physicsBody?.restitution = 0
        healthRegnerator.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 20)
        
        healthRegnerator.name = "healthrestore"
        
        healthRegnerator.physicsBody?.categoryBitMask = category.healthrestore
        healthRegnerator.physicsBody?.contactTestBitMask = category.mainCharacterCategory
        
        healthRegnerator.zPosition = 1
        
        if paused == false {
        
        healthRegnerator.run(levitateAndRemove(xSpeed: true))
        
        return healthRegnerator
    }
        let EmptyNode = SKSpriteNode()
        
        return EmptyNode
    }
}

class startingButton:SKScene {
    
    
    
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createButton()-> SKNode {
        
        let button = SKSpriteNode(imageNamed: "StartButton")
       
        button.size = CGSize(width: self.frame.size.width / 2, height: self.frame.size.height / 3)
        button.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        button.name = "startButton"
       
       
        return button
        
    }
    
}


class restartButton:SKScene {
    
    
    override init(size:CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createRestartButton() ->SKNode {
        
        let RestartButton = SKSpriteNode(imageNamed: "RestartButton")
        
        RestartButton.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        RestartButton.size = CGSize(width: self.frame.size.width / 2, height: self.frame.size.height / 4)
        
        RestartButton.zPosition = 0
        RestartButton.name = "restartButton"
        
      
        

        return RestartButton
        
    }
    
    
    
}


