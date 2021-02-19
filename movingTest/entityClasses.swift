//
//  entityClass.swift
//  movingTest
//
//  Created by Minseo Kim on 2/17/21.
//

import Foundation
import SpriteKit


class hostileCloud: SKScene, createCharacter {
   
  
    var timeToGoUp = 3
   

   
   init(sceneSize size: CGSize) {
       
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
        Entity.physicsBody?.contactTestBitMask = category.mainCharacterCategory
        Entity.physicsBody?.collisionBitMask = category.mainCharacterCategory
        Entity.physicsBody?.categoryBitMask = category.hostileCloudCategory
        Entity.size = CGSize(width: self.frame.width / 6, height: self.frame.height / 12)
    Entity.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width / 20, height: self.frame.height / 30))
    

        Entity.position = CGPoint(x: Int.random(in: 0...Int(self.frame.width)), y: 1)
        Entity.name = "hostileCloud"
        Entity.zPosition = 0
        Entity.physicsBody?.restitution = 0
        Entity.zRotation = 0


        Entity.run(levitateAndRemove(xSpeed: false))



        return Entity
      
      
       
   }

    
}
    

class cloud: SKScene, createCharacter {
        
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
   

class bomb:SKScene, createCharacter {
    
    var timeToGoUp = 4
    
    func createBomb() ->SKNode {
        
        let bomb = SKSpriteNode(imageNamed: "bomb")
        
        bomb.physicsBody?.isDynamic = false
        bomb.physicsBody?.affectedByGravity = false
        bomb.name = "bomb"
        
        bomb.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width/10, height: self.frame.size.height/30))
        bomb.position = CGPoint(x: Int.random(in: 0...Int(self.frame.size.width)), y: 1)
        bomb.physicsBody?.allowsRotation = false
        bomb.physicsBody?.restitution = 0
        bomb.zPosition = 1
        
        bomb.run(levitateAndRemove(xSpeed: false))
        
        return bomb
    }
    
}

class healthBottle: SKScene, createCharacter {
    
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
        
        healthRegnerator.name = "healthrestore"
        
        healthRegnerator.physicsBody?.categoryBitMask = category.healthrestore
        healthRegnerator.physicsBody?.contactTestBitMask = category.mainCharacterCategory
        healthRegnerator.physicsBody?.collisionBitMask = category.mainCharacterCategory
        healthRegnerator.zPosition = 1
        
        
        healthRegnerator.run(levitateAndRemove(xSpeed: true))
        
        return healthRegnerator
    }
}





