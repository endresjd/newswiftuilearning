//
//  ScrollEdgeEffectStyleExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/8/25.
//

import SwiftUI

/// Disable Edge Effect.
///
/// By default, a scroll view will render an automatic edge effect. You use this modifier to change rendered edge effect style.
/// This example disables the huge blur effect under that toolbar.
@available(iOS 26.0, *)
struct ScrollEdgeEffectStyleExample: View {
    @State private var style = ScrollEdgeEffectStyle.automatic

    var styleText: String {
        switch style {
        case .automatic:
            "Automatic"
        case .hard:
            "Hard"
        case .soft:
            "Soft"
        default:
            "Huh?"
        }
    }

    var body: some View {
        NavigationStack {
            List(1..<101) { i in
                Text("Row \(i)")
            }
            .scrollEdgeEffectStyle(style, for: .top)
            .toolbar {
                ToolbarItem(placement: .title) {
                    Button {
                        switch style {
                        case .automatic, .soft:
                            style = .hard
                        default:
                            style = .soft
                        }
                    } label: {
                        Label(styleText, systemImage: "sparkles")
                            .labelStyle(.titleAndIcon)
                    }
                }
            }
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        ScrollEdgeEffectStyleExample()
    } else {
        FutureFeatureView()
    }
}
