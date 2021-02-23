//
//  gameElements.swift
//  movingTest
//
//  Created by Minseo Kim on 1/25/21.
//

import Foundation
import SpriteKit




struct category {
    
    static let mainCharacterCategory:UInt32 = 0x1 << 0
    // 1
    static let hostileCloudCategory:UInt32 = 0x1 << 1
    //2
    static let backgroundCategory:UInt32 = 0x1 << 2
    //4
    static let healthrestore:UInt32 = 0x1 << 3
    //8
    static let bombCategory:UInt32 = 0x1 << 4
    //16
    
    
}





extension GameScene {
    
    
   
    
    
    
    
//    func createHostileCloud() {
//
//        let hostileCloud = SKSpriteNode(imageNamed: "thundercloud-hostile")
//
//        physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
//        self.physicsWorld.contactDelegate = self
//        hostileCloud.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width/10, height: self.frame.height/20))
//
//        hostileCloud.physicsBody?.isDynamic = false
//        hostileCloud.physicsBody?.affectedByGravity = false
//        hostileCloud.physicsBody?.restitution = 0
//        hostileCloud.position = CGPoint(x: Int.random(in: 0...Int(self.frame.size.width)), y: 1)
//        hostileCloud.name = "hostileCloud"
//        hostileCloud.physicsBody!.collisionBitMask = category.mainCharacterCategory
//        hostileCloud.physicsBody!.categoryBitMask = category.hostileCloudCategory
//        hostileCloud.physicsBody!.contactTestBitMask = category.mainCharacterCategory
//
//
//        let movingUp = SKAction.moveBy(x: 0, y: self.frame.size.height - 1, duration: 3)
//        let removeCloud = SKAction.removeFromParent()
//        let moveAndRemove = SKAction.sequence([movingUp,removeCloud])
//
//        hostileCloud.run(moveAndRemove)
//
//        self.addChild(hostileCloud)
//
//
//    }
    
    
    
    
    
    
    
    func createMainCharacter() {
        physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsWorld.contactDelegate = self
        mainCharacter.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width / 6, height: self.frame.size.height/7))
        
        mainCharacter.physicsBody?.affectedByGravity = false
        mainCharacter.physicsBody?.isDynamic = true
        mainCharacter.position = CGPoint(x:self.frame.size.width/2, y: self.frame.size.height * 3 / 4)
        mainCharacter.physicsBody?.restitution = 0
        mainCharacter.physicsBody?.allowsRotation = false
        mainCharacter.name = "mainCharacter"
        
        mainCharacter.physicsBody!.categoryBitMask = category.mainCharacterCategory
        mainCharacter.physicsBody!.contactTestBitMask = category.hostileCloudCategory | category.healthrestore
        addChild(mainCharacter)
    }
    
    
    
    
    
    
    
    func reset() {
        
        totalHealth = 10000
        
        removeAllChildren()
        
        createMainCharacter()
        
        createHpBar()
        
        score = 0
        
        createScoreDisplay()
        
        createHighScoreDisplay()
    }
    
    
    func createBackground() {
        
        self.backgroundColor = SKColor(red: 80.0/255.0, green: 192.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        self.physicsBody?.collisionBitMask = category.mainCharacterCategory
        self.physicsBody?.contactTestBitMask = category.mainCharacterCategory
        self.physicsBody?.categoryBitMask = category.backgroundCategory
        
        
        
        self.physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.affectedByGravity = false
        
    }
    
    
    func createHpBar(){
        
        hp.position = CGPoint(x: self.frame.size.width/5, y: self.frame.size.height * 15 / 16)
        hp.text = "Health:\(totalHealth)"
        hp.fontColor = SKColor.red
        hp.fontSize = 15
        addChild(hp)
        
    }
    
    
//    func createCloud() {
//
//        let cloud = SKSpriteNode(imageNamed: "cloud")
//
//
//
//        cloud.physicsBody?.affectedByGravity = false
//        cloud.physicsBody?.isDynamic = false
//        cloud.zPosition = -1
//        cloud.position = CGPoint(x: Int.random(in: 0...Int(self.frame.size.width)), y: -1)
//        cloud.size = CGSize(width: self.frame.width/2, height: self.frame.size.height/5)
//
//        let movingUp = SKAction.moveBy(x: 0, y: self.frame.size.height, duration: 10)
//        let remove = SKAction.removeFromParent()
//
//        let seq = SKAction.sequence([movingUp,remove])
//
//        cloud.run(seq)
//
//        self.addChild(cloud)
//
//
//    }
//
    
    
//    func createHealthRecovery() {
//
//        let healthRegnerator = SKSpriteNode(imageNamed: "healthrestore")
//        physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
//        self.physicsWorld.contactDelegate = self
//
//
//        healthRegnerator.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width/20, height: self.frame.height/30))
//        healthRegnerator.physicsBody?.affectedByGravity = false
//        healthRegnerator.physicsBody?.isDynamic = false
//        healthRegnerator.position = CGPoint(x: Int.random(in: 0...Int(self.frame.width)), y: 1)
//        healthRegnerator.physicsBody?.restitution = 0
//
//        healthRegnerator.name = "healthrestore"
//
//
//
//        healthRegnerator.physicsBody?.restitution = 0
//
//        healthRegnerator.physicsBody?.categoryBitMask = category.healthrestore
//        healthRegnerator.physicsBody?.contactTestBitMask = category.mainCharacterCategory
//        healthRegnerator.physicsBody?.collisionBitMask = category.mainCharacterCategory
//        healthRegnerator.zPosition = 1
//
//        let move = SKAction.moveBy(x: 0, y: self.frame.size.height - 1, duration: 4)
//
//        let remove = SKAction.removeFromParent()
//
//
//        let S = SKAction.sequence([move,remove])
//
//        healthRegnerator.run(S)
//
//        self.addChild(healthRegnerator)
//
//
//    }
    
    
    
//    func createBomb() {
//
//        let bomb = SKSpriteNode(imageNamed: "bomb")
//
//        physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
//        self.physicsWorld.contactDelegate = self
//
//        bomb.physicsBody?.isDynamic = false
//        bomb.physicsBody?.affectedByGravity = false
//        bomb.name = "bomb"
//
//        bomb.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width/10, height: self.frame.size.height/30))
//        bomb.position = CGPoint(x: Int.random(in: 0...Int(self.frame.size.width)), y: 1)
//        bomb.physicsBody?.allowsRotation = false
//        bomb.physicsBody?.restitution = 0
//        bomb.zPosition = 1
//
//        let move = SKAction.moveBy(x: self.frame.size.width, y: self.frame.size.height - 1, duration: 4)
//
//        let remove = SKAction.removeFromParent()
//
//        let S = SKAction.sequence([move,remove])
//
//        bomb.run(S)
//
//      addChild(bomb)
//
//    }
  
    
    func createMainCharacter2() {
        mainCharacter.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width / 6, height: self.frame.size.height/7))
        
        mainCharacter.physicsBody?.affectedByGravity = false
        mainCharacter.physicsBody?.isDynamic = true
        mainCharacter.position = currentPosition
        mainCharacter.physicsBody?.restitution = 0
        mainCharacter.physicsBody?.allowsRotation = false
        mainCharacter.name = "mainCharacter"
        addChild(mainCharacter)
    }
    
    func createElectrocuted() {


        electrocuted.position = currentPosition
        electrocuted.physicsBody?.affectedByGravity = false
        electrocuted.physicsBody?.isDynamic = false
        electrocuted.size = CGSize(width: self.frame.size.width/3, height: self.frame.size.height/5)


        self.addChild(electrocuted)
    }
    
    func removemainCharacter() {
        removeChildren(in: [mainCharacter])
        
    }
    
    func createScoreDisplay() {
        scoreDisplay.fontColor = SKColor.black
        scoreDisplay.fontSize = 20
        scoreDisplay.position = CGPoint(x: self.frame.width / 2, y: self.frame.height * 7 / 8)
        scoreDisplay.text = "score: \(score)"
        addChild(scoreDisplay)
        
    }
    
    func createHighScoreDisplay() {
        
        highScoreDisplay.fontColor = SKColor.black
        highScoreDisplay.fontSize = 15
        highScoreDisplay.position = CGPoint(x: self.frame.width * 3 / 5, y: self.frame.height * 15 / 16)
        highScoreDisplay.text = "high score: \(highScore)"
        addChild(highScoreDisplay)
    }
    
    
    
    
}



