//
//  ColorPickerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

struct ColorPickerExample: View {
    @State private var bgColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var bgColorNoOpacity = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)

    var body: some View {
        VStack {
            ColorPicker("Alignment Guide", selection: $bgColor)
            ColorPicker("Alignment Guide (no opacity)", selection: $bgColorNoOpacity, supportsOpacity: false)
        }
        .padding()
    }
}

#Preview {
    ColorPickerExample()
}
