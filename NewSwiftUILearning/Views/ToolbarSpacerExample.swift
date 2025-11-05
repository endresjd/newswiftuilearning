//
//  ToolbarSpacerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/8/25.
//

import SwiftUI

/// Puts space between buttons in a toolbar.
///
/// If there is no spacer we get one contiguous area with the buttons.  If there is
/// a spacer, then they both sit in their own bubble.
@available(iOS 26.0, *)
struct ToolbarSpacerExample: View {
    @State private var showSpacer = true

    var spacerText: String {
        guard showSpacer else {
            return "Show Spacer"
        }
        return "Hide Spacer"
    }

    var body: some View {
        NavigationStack {
            Button(spacerText) {
                showSpacer.toggle()
            }
            .toolbar {
                ToolbarItem {
                    Button("Delete", systemImage: "trash", role: .destructive) {}
                }

                if showSpacer {
                    ToolbarSpacer(.fixed)
                }

                ToolbarItem {
                    Button("Add", systemImage: "plus") {}
                }
            }
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        ToolbarSpacerExample()
    } else {
        FutureFeatureView()
    }
}
