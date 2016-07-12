//
//  GameScene.swift
//  metalslug
//
//  Created by stephane joussin on 30/06/2016.
//  Copyright (c) 2016 stephane joussin. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {


    var player : Player!
    
    override func didMoveToView(view: SKView) {
        
        player = Player( spriteNode: (childNodeWithName("player") as? SKSpriteNode)!  )
        player.walkAction()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        player.bombAction()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}