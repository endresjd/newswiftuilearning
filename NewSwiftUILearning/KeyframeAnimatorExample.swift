//
//  KeyframeAnimatorExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

// Keyframe-based animation is designed to accommodate a specific type of
// animation where each property is animated independently. By utilizing
// keyframes, we can animate individual properties separately, which in
// turn offers us greater flexibility and control over our animations
struct KeyframeAnimatorExample: View {
    // we begin by defining a struct that encompasses all the properties
    // we wish to animate.  These are the initial values used in the
    // animation.
    struct AnimationValues {
        var scale = 1.0
        var verticalStretch = 1.0
        var translation = CGSize.zero
        var opacity = 1.0
    }
    
    var body: some View {
        // The content closure updates every frame while animating, so avoid
        // performing any expensive operations directly within content
        Text("🐻")
            .font(.system(size: 100))
            .keyframeAnimator(initialValue: AnimationValues()) { content, value in
                content
                    .scaleEffect(value.scale)
                    .scaleEffect(y: value.verticalStretch)
                    .offset(value.translation)
                    .opacity(value.opacity)
            } keyframes: { _ in
                // The code in each KeyframeTrack describess the scale factor
                // at specific times within the animation
                KeyframeTrack(\.verticalStretch) {
                    LinearKeyframe(1.2, duration: 0.1)
                    SpringKeyframe(2.0, duration: 0.2, spring: .snappy)
                    CubicKeyframe(1.05, duration: 0.3)
                    CubicKeyframe(1.2, duration: 0.2)
                    CubicKeyframe(1.1, duration: 0.32)
                    CubicKeyframe(1.2, duration: 0.2)
                    CubicKeyframe(1.05, duration: 0.25)
                    CubicKeyframe(1.3, duration: 0.23)
                    CubicKeyframe(1.0, duration: 0.3)
                }

                KeyframeTrack(\.scale) {
                    CubicKeyframe(0.8, duration: 0.2)
                    CubicKeyframe(0.6, duration: 0.3)
                    CubicKeyframe(1.0, duration: 0.3)
                    CubicKeyframe(0.8, duration: 0.2)
                    CubicKeyframe(0.6, duration: 0.3)
                    CubicKeyframe(1.0, duration: 0.3)
                }

                KeyframeTrack(\.translation) {
                    SpringKeyframe(CGSize(width: 100, height: 100), duration: 0.4)
                    SpringKeyframe(CGSize(width: -50, height: -300), duration: 0.4)
                    SpringKeyframe(.zero, duration: 0.2)
                    SpringKeyframe(CGSize(width: -50, height: 200), duration: 0.3)
                    SpringKeyframe(CGSize(width: -90, height: 300), duration: 0.3)
                    SpringKeyframe(.zero, duration: 0.4)
                }

                KeyframeTrack(\.opacity) {
                    LinearKeyframe(0.5, duration: 0.2)
                    LinearKeyframe(1.0, duration: 0.23)
                    LinearKeyframe(0.7, duration: 0.25)
                    LinearKeyframe(1.0, duration: 0.33)
                    LinearKeyframe(0.8, duration: 0.2)
                    LinearKeyframe(1.0, duration: 0.23)
                }
            }
    }
}

#Preview {
    KeyframeAnimatorExample()
}
