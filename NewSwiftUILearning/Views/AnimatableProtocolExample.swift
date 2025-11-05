//
//  AnimatableProtocolExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/27/25.
//

import SwiftUI

/// Example of animation.
///
/// Using the View's Animatable Protocol.  in most standard animation
/// scenarios, we can rely on SwiftUI's state-driven mechanism to create
/// smooth animations. This is why, in everyday development, you rarely
/// need to directly interact with the Animatable protocol.
///
/// - SeeAlso: [Animatable Protocol: Taming Unruly SwiftUI Animations](https://itnext.io/animatable-protocol-taming-unruly-swiftui-animations-d1857c4b4da0?gi=fd248e42bbd3&skipOnboarding=1&source=--------------------------------------------)
struct AnimatableProtocolExample: View {
    @State private var x = 0.0
    @State private var animate = false

    var body: some View {
        VStack {
            Button("Move") {
                x = x == 0 ? 200 : 0
            }

            MoveView(x: x)
                .animation(.smooth, value: x)

            Text("Hello, world!")
                .animation(.smooth) {
                    $0
                        .opacity(animate ? 1 : 0.2)
                        .projectionOffset(y: animate ? 0 : 100)
                    // <-- Animation anomaly
                    // .offset(y: animate ? 0 : 100)
                }
            Button("Change") {
                animate.toggle()
            }
        }
    }
}

// Code from kurtlee93
extension View {
    func projectionOffset(x: CGFloat = 0, y: CGFloat = 0) -> some View {
        self.projectionOffset(.init(x: x, y: y))
    }

    func projectionOffset(_ translation: CGPoint) -> some View {
        modifier(ProjectionOffsetEffect(translation: translation))
    }
}

private struct ProjectionOffsetEffect: GeometryEffect {
    var translation: CGPoint
    var animatableData: CGPoint.AnimatableData {
        get { translation.animatableData }
        set { translation = .init(x: newValue.first, y: newValue.second) }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        .init(CGAffineTransform(translationX: translation.x, y: translation.y))
    }
}

/// View under examination.
///
/// Simple view that animates its movement on the screen when the
/// horizontal position changes.
private struct MoveView: View, @MainActor Animatable {
    var x: CGFloat
    // Receive animation interpolation via animatableData
    var animatableData: CGFloat {
        get {
            x
        }

        set {
            x = newValue
        }
    }

    var body: some View {
        Rectangle()
            .foregroundStyle(.red)
            .frame(width: 100, height: 100)
            .offset(x: x)
    }
}

#Preview {
    AnimatableProtocolExample()
}
