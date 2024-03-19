//
//  TransformedShapeExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/21/23.
//

import SwiftUI

/// Shows how to transform shapes using view modifiers.  iOS 13?
///
/// Specifically `rotationEffect` and `transformEffect`
struct TransformedShapeExample: View {
    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200)
            .foregroundColor(.blue)
            .rotationEffect(.degrees(22))
            .transformEffect(.identity)
    }
}

#Preview {
    TransformedShapeExample()
}
