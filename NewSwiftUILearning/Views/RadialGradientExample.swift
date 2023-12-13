//
//  RadialGradientExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

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
