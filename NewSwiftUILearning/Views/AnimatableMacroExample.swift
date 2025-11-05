//
//  AnimatableMacroExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/8/25.
//

import SwiftUI

// Rough edge: Will cause the macro to fail.  @available(iOS 26.0, *)
@Animatable
struct Wave: Shape {
    var amplitude: Double
    var frequency: Double
    var phase: Double

    func path(in rect: CGRect) -> Path {
        var path = Path()

        for x in stride(from: 0, through: rect.width, by: 1) {
            let angle = frequency * Double(x / rect.width) * 2 * .pi + phase
            let y = sin(angle) * amplitude + rect.midY
            let point = CGPoint(x: x, y: y)

            if x == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }

        return path
    }
}

/// Show how to animate using this new macro.
///
/// - Before iOS 26 this was a little tricky to use, because we needed to create an animatableData value to represent our animatable value
/// - If you're targeting iOS 26 or later, this becomes a lot easier thanks to the @Animatable macro, which automatically makes any properties animatable – you should delete animatableData entirely and let the macro do all the work for you.
///
/// With this, instead of manually animating each property, you animate them all, so you have to manually opt out some of them that you don't want
/// using ` @AnimatableIgnored`
///
/// - SeeAlso: [How to create animatable views, modifiers, and more](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-animatable-views-modifiers-and-more)
@available(iOS 26.0, *)
struct AnimatableMacroExample: View {
    @State private var phase = 0.0

    var body: some View {
        Wave(amplitude: 50, frequency: 2, phase: phase)
            .stroke(.green, lineWidth: 4)
            .onAppear {
                withAnimation(
                    .linear(duration: 1)
                        .repeatForever(autoreverses: false)
                ) {
                    phase = .pi * 2
                }
            }
    }
}

#Preview {
    if #available(iOS 26, *) {
        AnimatableMacroExample()
    } else {
        FutureFeatureView()
    }
}
