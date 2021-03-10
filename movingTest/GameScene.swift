//
//  GameScene.swift
//  movingTest
//
//  Created by Minseo Kim on 1/21/21.
//

import SpriteKit
import GameplayKit

var positionOfBomb = CGPoint(x: 0, y: 0)
var paused = true
let nonStopWorld = SKNode()

class GameScene: SKScene, SKPhysicsContactDelegate, createEntityFunctions {
    
    var lastUpdatedTime:TimeInterval = 0
    var deltaTime:TimeInterval = 0
    
    let mainCharacter = SKSpriteNode(imageNamed:"falling")
    let electrocuted = SKSpriteNode(imageNamed: "electrocuted")
    var thunderCloud = SKSpriteNode()
    let boom = SKSpriteNode(imageNamed: "Boom")
    var stopButtonPressed = false
    
    
    let scoreDisplay = SKLabelNode()
    var score = 0
    var totalHealth = 10000
    let hp = SKLabelNode()
   
    var currentPosition = CGPoint(x: 0, y: 0)
    let highScoreDisplay = SKLabelNode()
    var highScore = 0
    var positionOfBomb = CGPoint(x: 0, y: 0)
    
    
    
    
    override func didMove(to view: SKView) {
      //didMove function directly affects user interface, the screen you see.
        
        self.anchorPoint = CGPoint(x: 0, y: 0)
        physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        // sets gravity to 0
        
        
        createBackground()
       
        
        let createStartButton = SKAction.run(StartButton)
        self.run(createStartButton)
        
        
        
       
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        for touch in touches {

            let location = touch.location(in: self)

            if atPoint(location).name == "restartButton" {

                self.removeAllChildren()

                paused = false
                
                createHpBar()
                
                createScoreDisplay()
                
                createHighScoreDisplay()
                
                createMainCharacter()
                
                createTouchNode()
                
                addChild(nonStopWorld)
                createStopButton()

                totalHealth = 10000
                
                hp.text = "Health:\(totalHealth)"
            }

        }
        
        
        
        
        
        for touchStop in touches {
            
            let location = touchStop.location(in: self)
            
           
            
            if atPoint(location).name == "stopButton" {
                
                
                
                switch stopButtonPressed {
                
                
                case false:
                    
                    stopButtonPressed = true
                    self.isPaused = true
                    nonStopWorld.isPaused = false
                    
               
                
                case true:
                    
                    stopButtonPressed = false
                    self.isPaused = false
                    
                    
                }
                
            }
            
        }
        
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let startButton = childNode(withName: "startButton")
        
        guard let StartButton = startButton else { return }
        
        
        
        for touchStart in touches {
            
            let location = touchStart.location(in: self)
            
            if StartButton.contains(location) {
                
                runActions()
                
                removeChildren(in: [StartButton])
            
            }
            
        
        }
    
        
        
        
        
        

    }
    
    
    
    func runActions() {
        
        paused = false
        
            let createBombForever = SKAction.run(Bomb)
        self.run(createBombForever)
        //creates Bomb on screen
        

        let createHostileCloudForever = SKAction.run(HostileCloud)
        self.run(createHostileCloudForever)
        // creates thunder cloud on screen

        
        let createHealthBottleForever = SKAction.run(HealthBottle)
        self.run(createHealthBottleForever)
       //creates health bottle on screen
        
        let createCloudForever = SKAction.run(Cloud)
        self.run(createCloudForever)
       // creates cloud on screen
        
        createScoreDisplay()
     
        createMainCharacter()
    
        createHpBar()
        
        createHighScoreDisplay()
        
        addChild(nonStopWorld)
        createStopButton()
        
        createTouchNode()
        
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
       
        for myTouch in touches {
            
            let location = myTouch.location(in: self)
            
            let xLocationMainCharacter = location.x
            
            let constantYMainCharacter = mainCharacter.position.y
            
            if atPoint(location).name == "touchNode" {
            
                if stopButtonPressed == false {
                
                    self.touchMoved(toPoint: CGPoint(x: xLocationMainCharacter, y: constantYMainCharacter))
            //every change in touch, this method detects its change in position while unpaused and sets the x value to new one where y is a constant.
                }
       
            }
        
        
        }
       
    
    }
    
   
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        guard let node1 = contact.bodyA.node else { return }
        guard let node2 = contact.bodyB.node else { return }
        
        
        
        
        if (node1.name == "mainCharacter" && node2.name == "hostileCloud") || (node1.name == "hostileCloud" && node2.name == "mainCharacter") {

            let damageGiven = 1000
            
            totalHealth -= damageGiven
            
            hp.text = "Health:\(totalHealth)"
            
            if totalHealth > 0 {
          
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

            } else {
                
                reset()
                
                paused = true
                
               
            }



        }
        
       
        
        if (node1.name == "mainCharacter" && node2.name == "bomb") || (node1.name == "bomb" && node2.name == "mainCharacter") {
           
            totalHealth -= 5000
            
            
            
            
            removeAllChildren()
            
            createHpBar()
            
            addChild(mainCharacter)
            
            createScoreDisplay()
            
            createHighScoreDisplay()
            
            createTouchNode()
            
            addChild(nonStopWorld)
            createStopButton()
            
            
            
            let delay = SKAction.wait(forDuration: 2)
            
           
           mainCharacter.position = currentPosition
            
            
            
            
            boom.position = positionOfBomb
            boom.size = CGSize(width: self.frame.width , height: self.frame.height / 2)
            
           
            func addBoom() {
                
                boom.run(SKAction.resize(byWidth: self.frame.width, height: self.frame.height, duration: 2))
                addChild(boom)
                
            }
            
            func removeBoom() {
                removeChildren(in: [boom])
            }

          
            
            let appendBoom = SKAction.run(addBoom)
            let terminateBoom = SKAction.run(removeBoom)
            let arrayActionBoom = SKAction.sequence([appendBoom,delay,terminateBoom])
            self.run(arrayActionBoom)
            
          
            if totalHealth <= 0 {

                paused = true
                
                removemainCharacter()
                
                reset()
                

            }

            
            
        }
        let HealthRestore = childNode(withName: "healthrestore")
        
        if (node1.name == "mainCharacter" && node2.name == "healthrestore") || (node1.name == "healthrestore" && node2.name == "mainCharacter") {
            
            if totalHealth <= 8000 && totalHealth > 0 {
            
               totalHealth += 2000
            
            } else if totalHealth == 9000 {
                
                totalHealth += 1000
            }
            
            
            
            hp.text = "Health:\(totalHealth)"
            
            removeChildren(in: [HealthRestore!])
            
        }
        
    
        
       
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        
        //controls the speed of the loop. Limiting the update loop to every 0.1 sec.
        if self.lastUpdatedTime == 0 {
            
            lastUpdatedTime = currentTime
            
        }
        
        deltaTime = currentTime - lastUpdatedTime
        
        if deltaTime < TimeInterval(0.1) {
            return
        }
        
        lastUpdatedTime = currentTime
        
        
        
        
        //now adding calculations of my code
        if paused == false {
        
            score += 10
        
        scoreDisplay.text = "score:\(score)"
        
        //score that updates constantly
        
        }
        
        if score > highScore {
            
            highScore = score
            
            highScoreDisplay.text = "highscore: \(highScore)"
            
        }
        
        //sets high score
        
        
        
        
        guard let Bomb = childNode(withName: "bomb") else { return }
       
        positionOfBomb = Bomb.position
        
        
        stopButtonPressed = false
        
        currentPosition = mainCharacter.position
    }
   
  
}


  

