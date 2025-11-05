//
//  KeyframeAnimatorExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Bounce a bear around the screen using iOS 17's `keyframeAnimator`.
///
/// Loops the given keyframes continuously, updating the view using the modifiers you apply in body.
///
/// Keyframe-based animation is designed to accommodate a specific type of animation where each property is
/// animated independently. By utilizing keyframes, we can animate individual properties separately, which in turn
/// offers us greater flexibility and control over our animations
///
/// Frames are tracked with a set of steps.  The ones used here are:
///
/// **KeyframeTrack**: A sequence of keyframes animating a single property of a root type
///
/// **LinearKeyframe**: A keyframe that uses simple linear interpolation
///
/// **SpringKeyframe**: A keyframe that uses a spring function to interpolate to the given value
///
/// **CubicKeyframe**: A keyframe that uses a cubic curve to smoothly interpolate between values
///
/// - Experiment: Look into other key frames if they are there.  Understand the meaning of all.  Especially cubic curve.
/// - ToDo: Truly look into this and try to understand how to use it.
/// - SeeAlso: [Creating Advanced Animations with KeyframeAnimator in SwiftUI](https://www.appcoda.com/keyframeanimator/)
/// - Requires: iOS 17
struct KeyframeAnimatorExample: View {
    /// Holds initial values for the properties we are animating.
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
