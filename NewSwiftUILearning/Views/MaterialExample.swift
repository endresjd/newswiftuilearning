//
//  MaterialExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/16/25.
//

import SwiftUI

/// Shows some material backgrounds and vibrancy.
///
/// - SeeAlso: [Using materials with SwiftUI](https://www.createwithswift.com/using-materials-with-swiftui)
struct MaterialExample: View {
    /// Different vibrancies to apply to something with a material background.
    ///
    /// Vibrancy helps ensure that the foreground content isn't too light, dark, or saturated compared with the material blur's translucency.
    private enum Vibrancy: String, CaseIterable {
        case primary
        case secondary
        case tertiary
        case quaternary

        var value: HierarchicalShapeStyle {
            switch self {
            case .primary:
                return .primary
            case .secondary:
                return .secondary
            case .tertiary:
                return .tertiary
            case .quaternary:
                return .quaternary
            }
        }
    }

    /// Range of material choices.
    private enum ExampleMaterial: String, CaseIterable {
        case regularMaterial = "Regular"
        case thickMaterial = "Thick"
        case thinMaterial = "Thin"
        case ultraThinMaterial = "Ultra Thin"
        case ultraThickMaterial = "Ultra Thick"

        var value: Material {
            switch self {
            case .regularMaterial:
                return .regularMaterial
            case .thickMaterial:
                return .thickMaterial
            case .thinMaterial:
                return .thinMaterial
            case .ultraThinMaterial:
                return .ultraThinMaterial
            case .ultraThickMaterial:
                return .ultraThickMaterial
            }
        }
    }

    /// Selected alignment choice.
    @State private var vibrancy = Vibrancy.primary

    /// Chosen material.
    @State private var material = ExampleMaterial.regularMaterial

    var body: some View {
        Form {
            EnumPicker(title: "Vibrancy", sorted: true, capitalized: true, selection: $vibrancy)
            EnumPicker(title: "Material", sorted: true, capitalized: true, selection: $material)

            Group {
                Text(".thinMaterial")
                    .bold()
                    .padding()
                    .background(material.value)

                Text(".thinMaterial in RoundedRectangle")
                    .bold()
                    .padding()
                    .background(material.value, in: RoundedRectangle(cornerRadius: 10.0))
            }
            .containerRelativeFrame(.horizontal)
            .background(.blue)
            .foregroundStyle(vibrancy.value)
        }
    }
}

#Preview {
    MaterialExample()
}
