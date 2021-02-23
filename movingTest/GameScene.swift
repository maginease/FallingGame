//
//  GameScene.swift
//  movingTest
//
//  Created by Minseo Kim on 1/21/21.
//

import SpriteKit
import GameplayKit

var positionOfBomb = CGPoint(x: 0, y: 0)

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let mainCharacter = SKSpriteNode(imageNamed:"falling")
    let electrocuted = SKSpriteNode(imageNamed: "electrocuted")
    var thunderCloud = SKSpriteNode()
    let boom = SKSpriteNode(imageNamed: "Boom")
    
    
    
    let scoreDisplay = SKLabelNode()
    var score = 0
    var totalHealth = 10_000
    let hp = SKLabelNode()
    var died: Bool = false
    let restartButton = SKShapeNode()
    var currentPosition = CGPoint(x: 0, y: 0)
    let highScoreDisplay = SKLabelNode()
    var highScore = 0
    var positionOfBomb = CGPoint(x: 0, y: 0)
    
    override func didMove(to view: SKView) {
      //didMove function directly affects user interface, the screen you see.
        
        self.anchorPoint = CGPoint(x: 0, y: 0)
        physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        createBackground()
       
        createScoreDisplay()
     
        createMainCharacter()
    
        createHpBar()
        
        createHighScoreDisplay()
        
        currentPosition = mainCharacter.position
        
        

//        let spawnH = SKAction.run(createHostileCloud)
//        let delayH = SKAction.wait(forDuration: 0.5)
//        let actionSeqH = SKAction.sequence([spawnH,delayH])
//        let repeatingHostileCloudProduction = SKAction.repeatForever(actionSeqH)
//        self.run(repeatingHostileCloudProduction)
        
        
//
//        let spawnC = SKAction.run(createCloud)
//        let delayC = SKAction.wait(forDuration: 3)
//        let actionSeqC = SKAction.sequence([spawnC,delayC])
//        let repeatingBackgroundCloudProduction = SKAction.repeatForever(actionSeqC)
//        self.run(repeatingBackgroundCloudProduction)
//        
        
        
        
//        let SpawnHe = SKAction.run(createHealthRecovery)
//        let delayHe = SKAction.wait(forDuration: 5)
//        let actionSeqHe = SKAction.sequence([SpawnHe,delayHe])
//        let repeatingHealthBottleProduction = SKAction.repeatForever(actionSeqHe)
//        self.run(repeatingHealthBottleProduction)

//        let spawnB = SKAction.run(createBomb)
//        let delay = SKAction.wait(forDuration: 15)
//        let actionSeqB = SKAction.sequence([spawnB,delay])
//        let repeatingBombProduction = SKAction.repeatForever(actionSeqB)
//        self.run(repeatingBombProduction)

        let Bomb = bomb(size: CGSize(width: self.frame.width, height: self.frame.height))
        
        func addBomb() {
            addChild(Bomb.createBomb())
        }
        
        let spawnBomb = SKAction.run(addBomb)
        let delayBomb = SKAction.wait(forDuration: 50)
        let sequenceBomb = SKAction.sequence([spawnBomb,delayBomb])
        let repeatingBombProduction = SKAction.repeatForever(sequenceBomb)
        self.run(repeatingBombProduction)
        
        
        
        
        let hostilecloud = hostileCloud(size: CGSize(width: self.frame.width, height: self.frame.height))

        func addHostile() {
            addChild(hostilecloud.createHostileCloud())
        }

        let spawnH = SKAction.run(addHostile)
        let delayH = SKAction.wait(forDuration: 0.5)
        let sequenceH = SKAction.sequence([spawnH,delayH])
        let repeatingHostileCloudProduction = SKAction.repeatForever(sequenceH)
        self.run(repeatingHostileCloudProduction)
        
        
        

        
        let healthbottle = healthBottle(size: CGSize(width: self.frame.width, height: self.frame.height))
        
        func addBottle() {
            addChild(healthbottle.createHealthBottle())
        }
        
        let spawnHealth = SKAction.run(addBottle)
        let delayHealth = SKAction.wait(forDuration: 5)
        let sequenceHealth = SKAction.sequence([spawnHealth,delayHealth])
        let repeatingHelathBottleReproduction = SKAction.repeatForever(sequenceHealth)
        self.run(repeatingHelathBottleReproduction)
       
        
    
        let Cloud = cloud(size: CGSize(width: self.frame.width, height: self.frame.height))
        func addCloud() {
            addChild(Cloud.createCloud())
        }
        
        let spawnCloud = SKAction.run(addCloud)
        let delayCloud = SKAction.wait(forDuration: 3)
        let sequenceCloud = SKAction.sequence([spawnCloud,delayCloud])
        let repeatingCloudProduction = SKAction.repeatForever(sequenceCloud)
        self.run(repeatingCloudProduction)
    }
    
    
    
    private func c_lang_test() {
        
        
        // MARK: - mixed C Language test
        
        print(" ")
        print(" C Language test...")
        
        let the_string = "Minseo Kim is giving to this function"
        
        guard var the_string_to_be_delivered_to_c_func = the_string.cString(using: .utf8) else {
            
            return
        }
        
        let a = toUpper( &the_string_to_be_delivered_to_c_func )
        

        print("\(String(cString: a!)+"\n"+String(cString: the_string_to_be_delivered_to_c_func))")
 
    }
    
    
    
   
    
    func touchMoved(toPoint pos : CGPoint) {
        mainCharacter.position = pos
        //sets mainCharacter's position(CGPoint) to pos
        currentPosition = pos
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchMoved(toPoint: t.location(in: self))
            //every change in touch, this method detects its change in position and sets the value to new one
            
        }
        
        if touches as NSObject == restartButton {
           
            reset()
            
        }
       
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        guard let node1 = contact.bodyA.node else { return }
        guard let node2 = contact.bodyB.node else { return }
        
        
        
        
        let HostileCloud = childNode(withName: "hostileCloud")
        
        if (node1.name == "mainCharacter" && node2.name == "hostileCloud") || (node1.name == "hostileCloud" && node2.name == "mainCharacter") {

          func removeelectrocuted() {
                removeChildren(in: [electrocuted])
            }

            let removeMainCharacter = SKAction.run(removemainCharacter)
            let removeElectrocuted = SKAction.run(removeelectrocuted)

            let appendElectrocuted = SKAction.run(createElectrocuted)
            let delay = SKAction.wait(forDuration: 0.6)
            let appendMainCharacter = SKAction.run(createMainCharacter2)

            let actionSequence = SKAction.sequence([removeMainCharacter,appendElectrocuted,delay,removeElectrocuted,appendMainCharacter])

            self.run(actionSequence)




            totalHealth -= 1000

            hp.text = "Health:\(totalHealth)"

            removeChildren(in: [HostileCloud!])




            if totalHealth <= 0 {

              reset()
                
                


            }

        }
        
       
        
        if (node1.name == "mainCharacter" && node2.name == "bomb") || (node1.name == "bomb" && node2.name == "mainCharacter") {
           
            totalHealth -= 1000
            
            removeAllChildren()
            
            createHpBar()
            createScoreDisplay()
            createHighScoreDisplay()
            
            mainCharacter.position = currentPosition
            
            addChild(mainCharacter)
            
            
            
            
            
            
            boom.position = positionOfBomb
            boom.size = CGSize(width: self.frame.width / 3, height: self.frame.height / 5)
            
           
            func addBoom() {
                addChild(boom)
            }
            
            func removeBoom() {
                removeChildren(in: [boom])
            }
            
           
            let appendBoom = SKAction.run(addBoom)
            let delayBoom = SKAction.wait(forDuration: 2)
            let terminateBoom = SKAction.run(removeBoom)
            let arrayActionBoom = SKAction.sequence([appendBoom,delayBoom,terminateBoom])
            self.run(arrayActionBoom)
            
        }
        let HealthRestore = childNode(withName: "healthrestore")
        
        if (node1.name == "mainCharacter" && node2.name == "healthrestore") || (node1.name == "healthrestore" && node2.name == "mainCharacter") {
            
            totalHealth += 2000
            hp.text = "Health:\(totalHealth)"
            
            removeChildren(in: [HealthRestore!])
            
        }
        
    
        
       
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        score += 10
        
        scoreDisplay.text = "score:\(score)"
        
        //score that updates constantly
        
        
        
        if score > highScore {
            
            highScore = score
            
        }
        
        highScoreDisplay.text = "highscore: \(highScore)"
        
        //sets high score
        
        
        
        
        guard let Bomb = childNode(withName: "bomb") else { return }
       
        positionOfBomb = Bomb.position
        
    }
   
  
}


  

