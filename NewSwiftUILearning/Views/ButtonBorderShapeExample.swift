//
//  ButtonBorderShapeExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

struct ButtonBorderShapeExample: View {
    var body: some View {
        Button("Capsule") {}
            .tint(.green)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)

        Button("Circle") {}
            .tint(.green)
            .buttonStyle(.bordered)
            .buttonBorderShape(.circle)
            .controlSize(.large)

        Button("Rounded Rectangle") {}
            .tint(.green)
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.large)

        Button("Rounded Rectangle Radius") {}
            .tint(.green)
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 45))
            .controlSize(.large)
    }
}

#Preview {
    ButtonBorderShapeExample()
}
