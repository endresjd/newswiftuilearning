//
//  TipKitExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/27/24.
//

import SwiftUI
import TipKit

/// Definition of a tip to be used inline as part of the view hierarchy.
///
/// Using these requires setup in the App class to configure all the tips
///
/// - SeeAlso: [Mastering TipKit: Basics](https://fatbobman.com/en/posts/mastering-tipkit-basic/?utm_source=newsletter&utm_medium=email&utm_campaign=ios_cocoa_treats&utm_term=2024-11-27)
struct InlineTip: Tip {
    var title: Text {
        Text("Save as a Favorite")
    }

    var message: Text? {
        Text("Your favorite backyards always appear at the top of the list.")
    }

    var image: Image? {
        Image(systemName: "star")
    }
}

/// Tip to be used as an overlay on top of a view hierarchy.
struct PopoverTip: Tip {
    var title: Text {
        Text("Add an Effect")
            .foregroundStyle(.indigo)
    }

    var message: Text? {
        Text("Touch and hold \(Image(systemName: "wand.and.stars")) to add an effect to your favorite image.")
    }
}

/// Shows a view with an inline tip and a popover tip.
struct TipKitExample: View {
    // Create an instance of your tip content.
    var tip = InlineTip()
    var popoverTip = PopoverTip()

    var body: some View {
        VStack(spacing: 20) {
            Text("A TipView embeds itself directly in the view. Make this style of tip your first choice as it doesn't obscure or hide any underlying UI elements.")

            // Place your tip near the feature you want to highlight.
            TipView(tip, arrowEdge: .bottom)
                .symbolRenderingMode(.multicolor)

            Button {
                // Invalidate the tip when someone uses the feature.
                tip.invalidate(reason: .actionPerformed)
            } label: {
                Label("Favorite", systemImage: "star")
            }

            Text("To dismiss the tip, tap the close button in the upper right-hand corner of the tip or tap the Favorite button to use the feature, which then invalidates the tip programmatically.")

            Divider()

            Image(systemName: "wand.and.stars")
                .imageScale(.large)
                .popoverTip(popoverTip)
                .onTapGesture {
                    // Invalidate the tip when someone uses the feature.
                    popoverTip.invalidate(reason: .actionPerformed)
                }

            Divider()

            Button("Reset") {
            }

            Spacer()
        }
        .padding()
        .navigationTitle("TipView")
    }
}

#Preview {
    TipKitExample()
}
