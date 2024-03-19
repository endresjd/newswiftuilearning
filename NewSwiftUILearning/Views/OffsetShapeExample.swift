//
//  OffsetShapeExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Draws a square that is offset 10 by 10 followed by a non offset one using iOS 13's `OffsetShape`.
///
/// I guess a way to specify a shape with a translation: A shape with a translation offset transform applied to it.
///
/// - Experiment: See where this would be used and why this method is better
struct OffsetShapeExample: View {
    var body: some View {
        // Not getting this one.
        OffsetShape(shape: Rectangle(), offset: CGSize(width: 10, height: 10))
            .size(width: 200, height: 200)
        
        Rectangle()
            .size(width: 200, height: 200)
    }
}

#Preview {
    OffsetShapeExample()
}
