//
//  ToggleExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/21/23.
//

import SwiftUI

/// Shows iOS 13's `Toggle` control.
struct ToggleExample: View {
    @State private var vibrateOnRing = true

    var body: some View {
        Toggle(
            "Vibrate on Ring",
            systemImage: "dot.radiowaves.left.and.right",
            isOn: $vibrateOnRing
        )
    }
}

#Preview {
    ToggleExample()
        .padding()
}
