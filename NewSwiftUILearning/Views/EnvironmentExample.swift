//
//  EnvironmentExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/1/25.
//

import SwiftUI

/// Show how to access the environment with the Observation framework.
struct EnvironmentExample: View {
    /// Shared data using Observation framework.
    ///
    /// Previously the view LibraryView retrieved a Library instance from the environment using the
    /// EnvironmentObject property wrapper. The new code, however, uses the Environment property wrapper instead
    @Environment(SharedContent.self) var shared

    var body: some View {
        VStack(spacing: 16) {
            Text(shared.sharedText)

            Button("Start tracking") {
                shared.trackSharedText()
            }

            Button("Change Text") {
                shared.sharedText = UUID().uuidString
            }
        }
    }

    /// Demonstrates safe use of withObservationTracking in Swift 6, without capturing non-Sendable values in the closure.
    ///
    /// - Important: As usual, I don't know how to use this in Swift 6.  Xcode is no help.
    func trackSharedText() {
        let currentText = shared.sharedText // Capture value, not reference

        // One time tracking of properties accessed in the first closure.
        // This method tracks access to any property within the apply closure, and informs
        // the caller of value changes made to participating properties by way of the onChange closure.
        // For example, the following code tracks changes to the sharedText, but it doesn’t track
        // changes to any other property of SharedContent if they exist:
        withObservationTracking {
            _ = shared.sharedText
        } onChange: { [currentText] in
            // Recursively observe again, if needed. Use a microtask to avoid stack overflow.
            Task { @MainActor [self] in
                print("sharedText changed from \(currentText) to \(shared.sharedText)")

                trackSharedText()
            }
        }
    }
}

#Preview {
    EnvironmentExample()
        .environment(SharedContent())
}
