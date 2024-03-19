//
//  EllipseExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Shows iOS 13's Ellipse filled with iOS 15's EllipticalGradient
struct EllipseExample: View {
    var body: some View {
        Ellipse()
            .fill(EllipticalGradient(gradient: .init(colors: [.red, .yellow])))
            .padding()
    }
}

#Preview {
    EllipseExample()
}
