//
//  LinearGradientExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

// iOS 16 gives newer shortcuts for gradients line .fill(.blue.gradient)
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
