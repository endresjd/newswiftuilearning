//
//  ScenePaddingExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/8/25.
//

import SwiftUI

/// Shows how to align the scene with system controls.
///
/// Example here shows get the right amount of padding to indent the scene to
/// match what the system is doing.  This seems to be a backwards compatible modifier
/// that adds the appropriate amount based on where it is used?
///
/// Adds padding to the specified edges of this view using an amount that’s appropriate for the current scene.
struct ScenePaddingExample: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                HStack {
                    Text("Scene padding")
                        .border(.red) // Border added for reference.

                    Spacer()
                }
                .scenePadding(.horizontal)

                HStack {
                    Text("Regular padding")
                        .border(.green)

                    Spacer()
                }
                .padding(.horizontal)

                HStack {
                    Text("Text with no padding")
                        .border(.blue)

                    Spacer()
                }

                Button("Button") {
                }
                .padding(.vertical)

                Spacer()
            }
            .navigationTitle("Hello World")
        }
    }
}

#Preview {
    ScenePaddingExample()
}
