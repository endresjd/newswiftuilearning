//
//  PhaseAnimatorExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// Shows continuous animation on a view that has tappable elements using iOS 17's `phaseAnimator`.
///
/// `phaseAnimator` Animates effects that you apply to a view over a sequence of phases that change continuously.
///
/// SwiftUI’s PhaseAnimator view and phaseAnimator modifier allow us to perform
/// multi-step animation by cycling through animation phases of our choosing,
/// either constantly or when triggered
///
/// Creating these multi-phase animations takes three steps:
///
/// Define the phases you’re going to work through. This can be any kind of
/// sequence, but you might find it easiest to work with a CaseIterable enum.
///
/// Read one phase inside your phase animator, and adjust your views to match how
/// you want that phase to look.
///
/// Optionally add a trigger to make the phase animator repeat its sequence from
/// the beginning. Without this it will cycle constantly.
///
/// - Requires: iOS 17
/// - SeeAlso: [How to create multi-step animations using phase animators](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-multi-step-animations-using-phase-animators), [Using multi-step animations in SwiftUI](https://www.createwithswift.com/using-multi-step-animations-in-swiftui/?utm_campaign=This%2BWeek%2Bin%2BSwift&utm_medium=email&utm_source=This_Week_in_Swift_171)
struct PhaseAnimatorExample: View {
    @State private var animationStepOne = 0
    @State private var animationStepTwo = 0

    var body: some View {
        // Scrollview introduces some clipping that I don't understand
        // just yet.  That's why this is Group for now.
        Group {
            Text("Hello, world!")
                .font(.largeTitle)
                .phaseAnimator([0, 1, 3]) { view, phase in
                    view
                        .scaleEffect(phase)
                        .opacity(phase == 1 ? 1 : 0)
                }
            
            VStack(spacing: 50) {
                PhaseAnimator([0, 1, 3]) { value in
                    Text("Hello, world!")
                        .font(.largeTitle)
                        .scaleEffect(value)
                        .opacity(value == 1 ? 1 : 0)

                    Text("Goodbye, world!")
                        .font(.largeTitle)
                        .scaleEffect(3 - value)
                        .opacity(value == 1 ? 1 : 0)
                }
            }
            .padding(.top, 50)

            Text("Hello, world enum!")
                .font(.largeTitle)
                .padding(.top, 50)
                .phaseAnimator(AnimationPhaseOne.allCases) { view, phase in
                    view
                        .scaleEffect(phase.rawValue)
                        .opacity(phase.rawValue == 1 ? 1 : 0)
                }

            // Run an animation based on a trigger.  This one doesn't
            // animate continuously but rather is a one and done.
            Button("Tap Me!") {
                animationStepOne += 1
            }
            .font(.largeTitle)
            .padding(.top, 50)
            .phaseAnimator(AnimationPhaseTwo.allCases, trigger: animationStepOne) { content, phase in
                content
                    .blur(radius: phase == .start ? 0 : 10)
                    .scaleEffect(phase == .middle ? 3 : 1)
            }
            
            // specify exactly which animation to use for each phase
            Button("Tap Me!") {
                animationStepTwo += 1
            }
            .font(.largeTitle)
            .padding(.top, 50)
            .phaseAnimator(AnimationPhaseThree.allCases, trigger: animationStepTwo) { content, phase in
                content
                    .blur(radius: phase == .start ? 0 : 10)
                    .scaleEffect(phase == .middle ? 3 : 1)
            } animation: { phase in
                switch phase {
                case .start, .end: .bouncy
                case .middle: .easeInOut(duration: 2)
                }
            }

            Text("Hello, world!")
                .font(.largeTitle)
                .padding(.top, 50)
                .phaseAnimator(AnimationPhaseClarity.allCases) { content, phase in
                    content
                        .scaleEffect(phase.scale)
                        .opacity(phase.opacity)
                }
        }
    }
}

private enum AnimationPhaseOne: Double, CaseIterable {
    case fadingIn = 0
    case middle = 1
    case zoomingOut = 3
}

private enum AnimationPhaseTwo: CaseIterable {
    case start, middle, end
}

private enum AnimationPhaseThree: CaseIterable {
    case start, middle, end
}

private enum AnimationPhaseClarity: CaseIterable {
    case fadingIn, middle, zoomingOut

    var scale: Double {
        switch self {
        case .fadingIn: 0
        case .middle: 1
        case .zoomingOut: 3
        }
    }

    var opacity: Double {
        switch self {
        case .fadingIn: 0
        case .middle: 1
        case .zoomingOut: 0
        }
    }
}

#Preview {
    PhaseAnimatorExample()
}
