//
//  SharedContent.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/1/25.
//

import SwiftUI

/// Shared content for the whole app.
///
/// Used as an example of how to set an environment object from the app
/// using the Observation Framework.
///
/// - SeeAlso: [Migrating from the Observable Object protocol to the Observable macro](https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro)
@Observable @MainActor final class SharedContent {
    var sharedText = "Hello, World!"
    
    /// Demonstrates safe use of withObservationTracking in Swift 6, without capturing non-Sendable values in the closure.
    ///
    /// - Important: As usual, I don't know how to use this in Swift 6.  Xcode is no help.
    func trackSharedText() {
        let currentText = sharedText // Capture value, not reference
        
        withObservationTracking {
            _ = sharedText
        } onChange: { [currentText] in
            // Hop back to the MainActor to access main-actor isolated state
            Task { @MainActor [self] in
                print("sharedText changed from \(currentText) to \(self.sharedText)")
                
                // Recursively observe again, if needed. Use a microtask to avoid stack overflow.
                self.trackSharedText()
            }
        }
    }
}
