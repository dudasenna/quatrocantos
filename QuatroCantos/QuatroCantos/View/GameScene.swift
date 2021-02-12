//
//  GameScene.swift
//  QuatroCantos
//
//  Created by Eduarda Senna on 11/02/21.
//

import SpriteKit
import GameplayKit
import CoreMotion

var answer = "neutral"
var counterAnswers = 0
var suggestionIndex = 0

class GameScene: SKScene {

//    var flower: SKNode!
//    var cover: SKNode!
    private var lastUpdateTime : TimeInterval = 0
    var motionManager = CMMotionManager()
    var pitch: Double = 0.0
    var roll: Double = 0.0
    var counterNunca = 0
    var counterJa = 0
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0
//        flower = self.childNode(withName: "flower")
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        self.motionManager.deviceMotionUpdateInterval = 1.0/60.0
        self.motionManager.showsDeviceMovementDisplay = true
        self.motionManager.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
        
        backgroundColor = .systemPink
        
        if let data = self.motionManager.deviceMotion {
            pitch = data.attitude.pitch
            roll = data.attitude.roll
            
            print(pitch)
            print(roll)
            
            if roll < 1 {
                if answer == "neutral" && counterAnswers < 4 {
                    counterNunca += 1
                    counterAnswers += 1
                }
                answer = "false"
                self.motionManager.stopDeviceMotionUpdates()
            } else if roll > 1.8 && counterAnswers < 4 {
                if answer == "neutral" {
                    counterJa += 1
                    counterAnswers += 1
                }
                answer = "true"
                backgroundColor = .green
                self.motionManager.stopDeviceMotionUpdates()
            } else {
                answer = "neutral"
            }
            
            if counterJa <= 1 {
                suggestionIndex = 0
            } else if counterJa >= 4 {
                suggestionIndex = 2
            } else {
                suggestionIndex = 1
            }
            
        }
        
//        flower.physicsBody!.applyForce(CGVector(dx: 50*roll, dy: 50*(-pitch)))
        
    }
    
//    func stopDeviceMotionUpdate() {}
}
