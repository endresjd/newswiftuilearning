//
//  LinearGradientExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// A box filled with a linear gradient from iOS 13
///
/// The gradient applies the color function along an axis, as defined by its start and end points. The 
/// gradient maps the unit space points into the bounding rectangle of each shape filled with the gradient.
///
/// - Remark: iOS 16 gives newer shortcuts for gradients line .fill(.blue.gradient)
struct LinearGradientExample: View {
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(gradient: Gradient(colors: [.red, .gray]), startPoint: .top, endPoint: .bottom)
            )
            .frame(width: 100, height: 100)
    }
}

#Preview {
    LinearGradientExample()
}
