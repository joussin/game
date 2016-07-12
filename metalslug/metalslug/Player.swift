//
//  Player.swift
//  metalslug
//
//  Created by stephane joussin on 06/07/2016.
//  Copyright © 2016 stephane joussin. All rights reserved.
//

import Foundation
import SpriteKit


class Player {
    
    var sprite : SKSpriteNode!
    
    var animationArray = [SKTexture]()
    
    init(spriteNode : SKSpriteNode) {
        sprite = spriteNode
        
        
    }
    
    func walkAction(){
        animate (16,imageName: "walking",fps: 0.1,loop: true,size: CGSize(width: 73 , height: 62))
        move()
    }
    
    func idleAction(){
        animate (4,imageName: "idle",fps: 0.1,loop: true,size: CGSize(width: 74 , height: 62))

    }
    
    func flyAction(){
        animate (3,imageName: "fly",fps: 0.1,loop: true,size: CGSize(width: 88 , height: 79))

    }
    
    func bombAction() {
        animate (18,imageName: "bomb",fps: 0.1,loop: false,size: CGSize(width: 127, height: 70))
    }
    
    func animate (nbImage: Int,imageName: String,fps: Double,loop: Bool,size: CGSize){
        animationArray.removeAll()
        for index in 1...nbImage {
            animationArray.append(SKTexture(imageNamed: imageName + "-\(index)"))
        }

         self.sprite.size = size
        if loop {
            sprite.removeAllActions()
            sprite.runAction(
                SKAction.repeatActionForever(
                     SKAction.sequence([
                        SKAction.animateWithTextures(animationArray, timePerFrame: fps)
                    ])
                )
            )
        } else {
            sprite.removeAllActions()
            sprite.runAction(
                SKAction.sequence([
                    SKAction.animateWithTextures(animationArray, timePerFrame: fps),
                    SKAction.runBlock({
                        self.idleAction()
                    })
                ])
            )
        }
    }
    
    
    
    func move() {
        let actionMove = SKAction.moveTo(CGPoint(x: 1955, y: sprite.position.y), duration: NSTimeInterval(88))
        
       sprite.runAction(SKAction.sequence([actionMove]))
    }

    
}