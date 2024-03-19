//
//  RoundedRectangleExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// Shows iOS 13's `RoundedRectangle`
struct RoundedRectangleExample: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .fill(Color.gray)
            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 200, height: 200)
    }
}

#Preview {
    RoundedRectangleExample()
}
