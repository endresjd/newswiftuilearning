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
@Observable final class SharedContent {
    var sharedText = "Hello, World!"
}
