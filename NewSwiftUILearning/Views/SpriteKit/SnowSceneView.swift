//
//  SnowSceneView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/17/25.
//

import SpriteKit
import SwiftUI

/// SwiftUI wrapper around SpriteKit scene.
///
/// - SeeAlso: [Creating a particles snow effect with SpriteKit and SwiftUI](https://tanaschita.com/spritekit-particles-snow-effect-swiftui)
struct SnowSceneView: View {
    var scene: SKScene {
        let scene = SnowScene()

        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear

        return scene
    }

    var body: some View {
        ZStack {
            Color.blue
                .opacity(0.33)

            // Image has to be in an Assets file and not directly in the bundle.
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fit)

            // SpriteView is configured with the .allowsTransparency option to render the particles over the SwiftUI view.
            // With this as the only view, nothing shows in non-dark mode.  White snow on a white background.
            SpriteView(scene: scene, options: [.allowsTransparency])
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SnowSceneView()
}
