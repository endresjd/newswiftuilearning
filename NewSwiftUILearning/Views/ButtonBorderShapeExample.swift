//
//  ButtonBorderShapeExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Examples of applying a button shape to a button in iOS 15.
///
/// The button seems to need a button style to give it some color.  Without that color
/// the shape will not display to the screen.  This also shows how to use a group to
/// apply one set of modifiers to a group of views.  More clear.
struct ButtonBorderShapeExample: View {
    var body: some View {
        Group {
            Button("Capsule") {
            }
            .buttonBorderShape(.capsule)

            Button("Circle") {
            }
            .buttonBorderShape(.circle)

            Button("Rounded Rectangle") {
            }
            .buttonBorderShape(.roundedRectangle)

            Button("Rounded Rectangle Radius") {
            }
            .buttonBorderShape(.roundedRectangle(radius: 45))
        }
        .tint(.green)
        .buttonStyle(.bordered)
        .controlSize(.large)
    }
}

#Preview {
    ButtonBorderShapeExample()
}
