//
//  GameScene.swift
//  metalslug
//
//  Created by stephane joussin on 30/06/2016.
//  Copyright (c) 2016 stephane joussin. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {


    var leftHand : SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        var leftArmAnimationArray = [SKTexture]()
        
        for index in 1...18 {
            leftArmAnimationArray.append(SKTexture(imageNamed: "bomb-\(index)"))
        }
        // Setup player
        leftHand = (childNodeWithName("player") as? SKSpriteNode)!
        
        let actionMove = SKAction.moveTo(CGPoint(x: 1955, y: leftHand.position.y), duration: NSTimeInterval(88))

        //leftHand.runAction(SKAction.sequence([actionMove]))
        
         leftHand.runAction(
            SKAction.repeatActionForever(
            SKAction.animateWithTextures(leftArmAnimationArray, timePerFrame: 0.1)
                )
        )
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}