//
//  PreviewStateExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/13/24.
//

import SwiftUI

/// Previews can be named and can use live state instad of constant.
struct PreviewStateExample: View {
    var body: some View {
        Text("Do this in Xcode")
    }
}

#Preview {
    PreviewStateExample()
}

@available(iOS 18.0, *)
#Preview("toggle") {
    @Previewable @State var toggled = true

    Toggle("Loud Noises", isOn: $toggled)
        .padding()
}

@available(iOS 18.0, *)
#Preview("constant") {
    Toggle("Loud Noises", isOn: .constant(false))
        .padding()
}
