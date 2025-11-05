//
//  RotatedShapeExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// Shows a rotated rectangle using iOS 13's RotatedShape.
///
/// A shape with a rotation transform applied to it.
/// Another one that I don't fully see the need for.  Maybe
/// the anchor point?
struct RotatedShapeExample: View {
    var body: some View {
        RotatedShape(shape: Rectangle(), angle: .degrees(-120))
            .fill(Color.gray)
            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 200, height: 200)
    }
}

#Preview {
    RotatedShapeExample()
}
