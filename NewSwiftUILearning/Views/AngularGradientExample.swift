//
//  AngularGradientExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// A Circle view filled with an angular gradient in iOS 13.
///
/// An angular gradient is also known as a “conic” gradient. This gradient applies the color function as the angle changes, relative to a center point and defined start and end angles.
/// If endAngle - startAngle > 2π, the gradient only draws the last complete turn. If endAngle - startAngle < 2π, the gradient fills the missing area with the
/// colors defined by gradient locations one and zero, transitioning between the two halfway across the missing area. The gradient maps the unit space center point into the bounding
/// rectangle of each shape filled with the gradient.
struct AngularGradientExample: View {
    var body: some View {
        Circle()
            .fill(
                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
            )
            .frame(width: 200, height: 200)
    }
}

#Preview {
    AngularGradientExample()
}
