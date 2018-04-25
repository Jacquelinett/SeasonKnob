//
//  GameScene.swift
//  WeatherKnob
//
//  Created by Jacqueline on 12/30/17.
//  Copyright © 2017 Jacqueline. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    weak var viewController: GameViewController!
    
    var springBackground : SKSpriteNode!
    var summerBackground : SKSpriteNode!
    var fallBackground : SKSpriteNode!
    var winterBackground : SKSpriteNode!
    
    override func didMove(to view: SKView) {
        springBackground = SKSpriteNode(imageNamed: "spring.jpeg")
        springBackground.position = CGPoint(x: 0, y: 0)
        self.addChild(springBackground)
        
        summerBackground = SKSpriteNode(imageNamed: "summer.jpeg")
        summerBackground.position = CGPoint(x: 0, y: 0)
        self.addChild(summerBackground)
        
        fallBackground = SKSpriteNode(imageNamed: "fall.jpeg")
        fallBackground.position = CGPoint(x: 0, y: 0)
        self.addChild(fallBackground)
        
        winterBackground = SKSpriteNode(imageNamed: "winter.jpeg")
        winterBackground.position = CGPoint(x: 0, y: 0)
        self.addChild(winterBackground)
        
        springBackground.isHidden = true;
        summerBackground.isHidden = true;
        fallBackground.isHidden = true;
        winterBackground.isHidden = true;
    }
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
