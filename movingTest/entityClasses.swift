//
//  entityClass.swift
//  movingTest
//
//  Created by Minseo Kim on 2/17/21.
//

import Foundation
import SpriteKit


class hostileCloud: SKScene, createCharacterScene {
   
  
    var timeToGoUp = 3
   
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


        Entity.run(levitateAndRemove(xSpeed: false))

    return Entity
      
      }

    
}
    

class cloud: SKScene, createCharacterScene {
        
        var timeToGoUp = 10
        
        func createCloud()-> SKNode {
            
            let Entity = SKSpriteNode(imageNamed: "cloud")
            
            Entity.physicsBody?.affectedByGravity = false
            Entity.physicsBody?.isDynamic = false
            Entity.zPosition = -1
            
            Entity.position = CGPoint(x: Int.random(in: 0...Int(self.frame.size.width)), y: -1)
            Entity.size = CGSize(width: self.frame.width/2, height: self.frame.size.height/5)

            Entity.run(levitateAndRemove(xSpeed: false))
            
            return Entity
        }
   }
   

class bomb:SKScene, createCharacterScene {
    
    var timeToGoUp = 4
    
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
        
        bomb.run(levitateAndRemove(xSpeed: false))
        
        return bomb
    }
    
    var childBomb = SKSpriteNode(imageNamed: "bomb")
    
   
    
    
}

class healthBottle: SKScene, createCharacterScene {
    
    var timeToGoUp = 4
    
    
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
        
        
        healthRegnerator.run(levitateAndRemove(xSpeed: true))
        
        return healthRegnerator
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
        
        let button = SKShapeNode(rectOf: CGSize(width: self.frame.size.width / 2, height: self.frame.size.height / 5))
        let text = SKLabelNode(text: "start")

        button.fillColor = SKColor.purple
        text.zPosition = 1
        text.fontSize = 20
        text.fontColor = SKColor.black
        button.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        button.name = "startButton"
        button.addChild(text)
       
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
        
        let RestartButton = SKShapeNode(rectOf: CGSize(width: self.frame.width / 2, height: self.frame.height / 2))
        RestartButton.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        RestartButton.fillColor = SKColor.purple
        RestartButton.zPosition = 0
        RestartButton.name = "restartButton"
        
        let text = SKLabelNode()
        text.zPosition = 1
        text.text = "Restart"
        text.fontColor = SKColor.black
        text.fontSize = 20
        RestartButton.addChild(text)
        

        return RestartButton
        
    }
    
}


