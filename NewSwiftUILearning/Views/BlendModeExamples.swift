//
//  BlendModeExamples.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/2/25.
//

import SwiftUI

/// Show how blend modes work on an image
///
/// - SeeAlso: [Blend Modes in SwiftUI](https://digitalbunker.dev/blend-modes-in-swiftui)
struct BlendModeExamples: View {
    private enum ExplainedBlendModes: String, Sendable, CaseIterable {
        case normal
        case multiply
        case screen
        case overlay
        case darken
        case lighten
        case colorDodge
        case colorBurn
        case softLight
        case hardLight
        case difference
        case exclusion
        case hue
        case saturation
        case color
        case luminosity
        case sourceAtop
        case destinationOver
        case destinationOut
        case plusDarker
        case plusLighter
        
        var mode: BlendMode {
            switch self {
            case .normal:
                return .normal
            case .multiply:
                return .multiply
            case .screen:
                return .screen
            case .overlay:
                return .overlay
            case .darken:
                return .darken
            case .lighten:
                return .lighten
            case .colorDodge:
                return .colorDodge
            case .colorBurn:
                return .colorBurn
            case .softLight:
                return .softLight
            case .hardLight:
                return .hardLight
            case .difference:
                return .difference
            case .exclusion:
                return .exclusion
            case .hue:
                return .hue
            case .saturation:
                return .saturation
            case .color:
                return .color
            case .luminosity:
                return .luminosity
            case .sourceAtop:
                return .sourceAtop
            case .destinationOver:
                return .destinationOver
            case .destinationOut:
                return .destinationOut
            case .plusDarker:
                return .plusDarker
            case .plusLighter:
                return .plusLighter
            }
        }
        
        /// Title to show for the selected item.
        ///
        /// - SeeAlso: [Blend Mode Cheat Sheet](https://trailingclosure.com/blendmode-cheat-sheet/)
        var title: String {
            switch self {
            case .normal:
                return "This is the standard blend mode which uses the top layer alone, without mixing its colors with the layer beneath it."
            case .multiply:
                return "Multiply blend mode multiplies the RGB channel numbers for each pixel from the top layer with the values for the corresponding pixel from the bottom layer. The result is always a darker picture; since each value is less than 1, their product will be less than either of the initial values."
            case .screen:
                return "With Screen blend mode the values of the pixels in the two layers are inverted, multiplied, and then inverted again. This yields the opposite effect to multiply, and results in a brighter picture."
            case .overlay:
                return "Overlay combines Multiply and Screen blend modes. The parts of the top layer where the base layer is light become lighter, the parts where the base layer is dark become darker. Areas where the top layer are mid grey are unaffected. An overlay with the same picture looks like an S-curve."
            case .darken:
                return "Darken Only creates a pixel that retains the smallest components of the foreground and background pixels."
            case .lighten:
                return "Lighten Only has the opposite action of Darken Only. It selects the maximum of each component from the foreground and background pixels."
            case .colorDodge:
                return "The Color Dodge blend mode divides the bottom layer by the inverted top layer. This lightens the bottom layer depending on the value of the top layer: the brighter the top layer, the more its color affects the bottom layer. Blending any color with white gives white. Blending with black does not change the image."
            case .colorBurn:
                return "The Color Burn mode divides the inverted bottom layer by the top layer, and then inverts the result. This darkens the top layer increasing the contrast to reflect the color of the bottom layer. The darker the bottom layer, the more its color is used. Blending with white produces no difference. When top layer contains a homogeneous color, this effect is equivalent to changing the black point to the inverted color."
            case .softLight:
                return "Soft light is most closely related to Overlay and is only similar to Hard Light by name. Different for every program."
            case .hardLight:
                return "Hard Light is also a combination of Multiply and Screen. Hard Light affects the blend layer's relationship to the base layer in the same way Overlay affects the base layer's relationship to the blend layer. The inverse relationship between Overlay and Hard Light makes them \"commuted blend modes\""
            case .difference:
                return "Difference subtracts the bottom layer from the top layer or the other way round, to always get a positive value. Blending with black produces no change, as values for all colors are 0. (The RGB value for black is (0,0,0).) Blending with white inverts the picture."
            case .exclusion:
                return "Blending with white inverts the base color values, while blending with black produces no change. However, Blending with 50% gray produces 50% gray."
            case .hue:
                return "The Hue blend mode preserves the luma and chroma of the bottom layer, while adopting the hue of the top layer."
            case .saturation:
                return "The Saturation blend mode preserves the luma and hue of the bottom layer, while adopting the chroma of the top layer."
            case .color:
                return "The Color blend mode preserves the luma of the bottom layer, while adopting the hue and chroma of the top layer."
            case .luminosity:
                return "The Luminosity blend mode preserves the hue and chroma of the bottom layer, while adopting the luma of the top layer."
            case .sourceAtop:
                return "The Source Atop and Destination Atop composition modes combine the alpha channels of the source and destination images, before blending the source on top of the destination or vice versa."
            case .destinationOver:
                return "Content is drawn behind the existing canvas content."
            case .destinationOut:
                return "The existing content is kept where it doesn't overlap the new shape."
            case .plusDarker:
                return "This blend mode simply adds pixel values of one layer with the other then subtracts 1 from the end values."
            case .plusLighter:
                return "This blend mode simply adds pixel values of one layer with the other."
            }
        }
    }
    
    /// Blend mode we will display
    @State private var mode = ExplainedBlendModes.normal
    
    var body: some View {
        VStack {
            Form {
                Image("dog")
                    .resizable()
                    .scaledToFill()
                    .padding()
                    .overlay {
                        // The content that is to be blended with
                        // the image.
                        Rectangle()
                            .fill(Color.red)
                            .blendMode(mode.mode)
                    }

                EnumPicker(title: "Mode", sorted: true, selection: $mode)
                
                Text(mode.title)
            }
        }
        .navigationTitle("Blend Modes")
    }
}

#Preview {
    BlendModeExamples()
}
