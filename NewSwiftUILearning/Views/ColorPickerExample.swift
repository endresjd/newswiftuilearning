//
//  ColorPickerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Shows how to use iOS 14's ColorPicker both with or without opacity.
///
/// The color picker provides a color well that shows the currently selected color, and displays the
/// larger system color picker that allows users to select a new color.
struct ColorPickerExample: View {
    @State private var bgColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var bgColorNoOpacity = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)

    var body: some View {
        VStack {
            ColorPicker("Alignment Guide", selection: $bgColor)
            Text("\(bgColor.description)")

            ColorPicker("Alignment Guide (no opacity)", selection: $bgColorNoOpacity, supportsOpacity: false)
            Text("\(bgColorNoOpacity.description)")
        }
        .padding()
    }
}

#Preview {
    ColorPickerExample()
}
