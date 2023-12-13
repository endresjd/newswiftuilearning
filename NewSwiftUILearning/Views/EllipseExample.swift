//
//  EllipseExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

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
