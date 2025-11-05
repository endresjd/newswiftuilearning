//
//  ScaledShapeExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// Shows iOS 13's `ScaledShape`.
struct ScaledShapeExample: View {
    var body: some View {
        ScaledShape(shape: Rectangle(), scale: CGSize(width: 1.25, height: 0.50))
            .fill(Color.gray)
            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 200, height: 200)
    }
}

#Preview {
    ScaledShapeExample()
}
