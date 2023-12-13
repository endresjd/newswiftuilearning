//
//  AngularGradientExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

struct AngularGradientExample: View {
    var body: some View {
        Circle()
            .fill(
                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
            )
            .frame(width: 200, height: 200)
    }
}

#Preview {
    AngularGradientExample()
}
