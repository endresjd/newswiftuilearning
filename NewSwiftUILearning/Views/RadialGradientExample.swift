//
//  RadialGradientExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// Shows iOS 13's `RadialGradient`.
///
/// The gradient applies the color function as the distance from a center point,
/// scaled to fit within the defined start and end radii. The gradient maps the unit
/// space center point into the bounding rectangle of each shape filled with the gradient.
struct RadialGradientExample: View {
    var body: some View {
        Circle()
            .fill(
                RadialGradient(
                    gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]),
                    center: .center,
                    startRadius: 50,
                    endRadius: 100
                )
            )
            .frame(width: 200, height: 200)
    }
}

#Preview {
    RadialGradientExample()
}
