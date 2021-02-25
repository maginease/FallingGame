//
//  creatingHostileCloudNonStop.swift
//  movingTest
//
//  Created by Minseo Kim on 2/24/21.
//

import Foundation
import SpriteKit

protocol createCharactersFunctions:SKScene {}

extension createCharactersFunctions {
    
    func HostileCloud() {
        
        let hostilecloud = hostileCloud(size: CGSize(width: self.frame.width, height: self.frame.height))

        func addHostile() {
            addChild(hostilecloud.createHostileCloud())
        }

        let spawnH = SKAction.run(addHostile)
        let delayH = SKAction.wait(forDuration: 0.5)
        let sequenceH = SKAction.sequence([spawnH,delayH])
        let repeatingHostileCloudProduction = SKAction.repeatForever(sequenceH)
        
        self.run(repeatingHostileCloudProduction)
    }
    
    func Cloud() {
        
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
    
    func Bomb() {
        
        let Bomb = bomb(size: CGSize(width: self.frame.width, height: self.frame.height))
        
        func addBomb() {
            addChild(Bomb.createBomb())
        }
        
        let spawnBomb = SKAction.run(addBomb)
        let delayBomb = SKAction.wait(forDuration: 50)
        let sequenceBomb = SKAction.sequence([spawnBomb,delayBomb])
        let repeatingBombProduction = SKAction.repeatForever(sequenceBomb)
        self.run(repeatingBombProduction)
        
    }
    
    func HealthBottle() {
        
        let healthbottle = healthBottle(size: CGSize(width: self.frame.width, height: self.frame.height))
        
        func addBottle() {
            addChild(healthbottle.createHealthBottle())
        }
        
        let spawnHealth = SKAction.run(addBottle)
        let delayHealth = SKAction.wait(forDuration: 5)
        let sequenceHealth = SKAction.sequence([spawnHealth,delayHealth])
        let repeatingHelathBottleReproduction = SKAction.repeatForever(sequenceHealth)
        self.run(repeatingHelathBottleReproduction)
        
    }
    
    func StartButton() {
        
        let StartingButton = startingButton(size: CGSize(width: self.frame.width, height: self.frame.height))
        func startButtonCreate() { addChild(StartingButton.createButton()) }
        let creatingStart = SKAction.run(startButtonCreate)
        self.run(creatingStart)
        
    }
    
    func RestartButton() {
        
        let RestartButton = restartButton(size: CGSize(width: self.frame.width, height: self.frame.height))
        func addRestartButton() { addChild(RestartButton.createRestartButton()) }
        let AddRestart = SKAction.run(addRestartButton)
        self.run(AddRestart)
        
    }
    
}


