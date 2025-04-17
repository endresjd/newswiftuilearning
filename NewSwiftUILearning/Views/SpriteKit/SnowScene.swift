//
//  SnowScene.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/17/25.
//

import Foundation
import SpriteKit

/// SnowScene for SpriteKit
///
/// In SpriteKit, a scene (SKScene) acts as the root container for all visual content in a 2D space. Think of it as a stage where various elements like sprites,
/// shapes, and particle effects are added as nodes to create a complete visual experience. Each scene can be thought of as a separate screen or a distinct
/// part of your app's interface, handling its own rendering and animations.
///
/// - SeeAlso: [Creating a particles snow effect with SpriteKit and SwiftUI](https://tanaschita.com/spritekit-particles-snow-effect-swiftui)
class SnowScene: SKScene {
    let snowEmitterNode = SKEmitterNode(fileNamed: "snow.sks")

    override func didMove(to view: SKView) {
        guard let snowEmitterNode = snowEmitterNode else {
            return
        }
        
        snowEmitterNode.particleSize = CGSize(width: 50, height: 50)
        snowEmitterNode.particleLifetime = 20
        snowEmitterNode.particleLifetimeRange = 6
        
        addChild(snowEmitterNode)
    }

    override func didChangeSize(_ oldSize: CGSize) {
        guard let snowEmitterNode = snowEmitterNode else {
            return
        }
        
        snowEmitterNode.particlePosition = CGPoint(x: size.width/2, y: size.height)
        snowEmitterNode.particlePositionRange = CGVector(dx: size.width, dy: size.height)
    }
}

