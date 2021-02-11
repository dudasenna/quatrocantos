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

class GameScene: SKScene {

    var flower: SKNode!
    var cover: SKNode!
    private var lastUpdateTime : TimeInterval = 0
    var motionManager = CMMotionManager()
    var pitch: Double = 0.0
    var roll: Double = 0.0
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0
//        flower = self.childNode(withName: "flower")
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        self.motionManager.deviceMotionUpdateInterval = 1.0/60.0
        self.motionManager.showsDeviceMovementDisplay = true
        self.motionManager.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
        
        if let data = self.motionManager.deviceMotion {
            pitch = data.attitude.pitch
            roll = data.attitude.roll
            
            print(pitch)
            print(roll)
            
            if roll > -1.1 {
                answer = "false"
//                cover = self.childNode(withName: "cover")
                backgroundColor = .red
//                flower = SKSpriteNode(imageNamed: "cover")
                self.motionManager.stopDeviceMotionUpdates()
            } else if roll < -1.9 {
                answer = "true"
//                flower = self.childNode(withName: "flower")
                backgroundColor = .green
                self.motionManager.stopDeviceMotionUpdates()
            } else {
                backgroundColor = .blue
            }
        }
        
//        flower.physicsBody!.applyForce(CGVector(dx: 50*roll, dy: 50*(-pitch)))
        
    }
    
//    func stopDeviceMotionUpdate() {}
}
