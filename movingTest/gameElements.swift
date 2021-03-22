//
//  gameElements.swift
//  movingTest
//
//  Created by Minseo Kim on 1/25/21.
//

import Foundation
import SpriteKit




struct category {
    
    static let mainCharacterCategory:UInt32 = 0x1 << 2
    // 4
    static let hostileCloudCategory:UInt32 = 0x1 << 1
    //2
    static let backgroundCategory:UInt32 = 0x1 << 0
    //1
    static let healthrestore:UInt32 = 0x1 << 3
    //8
    static let bombCategory:UInt32 = 0x1 << 4
    //16
    
    
}





extension GameScene {
    
    
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
        
        removeAllChildren()
        
        score = 0
       
        speedForHostile = 3
       
        let CreateRestartButton = SKAction.run(RestartButton)
        self.run(CreateRestartButton)
        
      
        
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
    
    
    func createHpBar() {
        
        hp.position = CGPoint(x: self.frame.size.width/5, y: self.frame.size.height * 15 / 16)
        hp.text = "Health:\(totalHealth)"
        hp.fontColor = SKColor.red
        hp.fontSize = 15
        addChild(hp)
        
    }
    
 
  
    
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
        highScoreDisplay.position = CGPoint(x: self.frame.width * 4 / 5, y: self.frame.height * 15 / 16)
        highScoreDisplay.text = "high score: \(highScore)"
        addChild(highScoreDisplay)
    }
    
    func createStopButton() {

        let stopButton = SKSpriteNode(imageNamed: "PauseButton")

        stopButton.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)

        stopButton.position = CGPoint(x: self.frame.width / 2, y: self.frame.height * 15 / 16)
        stopButton.name = "stopButton"

        nonStopWorld.addChild(stopButton)
        
    }
    
    
    func createTouchNode() {
        
        let touchNode = SKShapeNode(rectOf: CGSize(width: self.frame.width, height: self.frame.height / 2))
        
        touchNode.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 4)
        
        touchNode.name = "touchNode"
        
        addChild(touchNode)
    }
    
    func GameOverSound() {
        
        let gameOverSound = SKAudioNode(fileNamed: "game over.mp3")
        // duration: 3 sec
        
        func addSound() {
        
        mainCharacter.addChild(gameOverSound)
        
        }
        
        let add = SKAction.run(addSound)
        let wait = SKAction.wait(forDuration: 3)
        
        func removeSound() {
            
            mainCharacter.removeChildren(in:[gameOverSound])
            
        }
        
        let RemoveSound = SKAction.run(removeSound)
        
        let actionArray = SKAction.sequence([add,wait,RemoveSound])
        
        self.run(actionArray)
    }
    
    
    
}



