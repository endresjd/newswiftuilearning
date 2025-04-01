//
//  NewSwiftUILearningApp.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI
import TipKit

/// Main entry point
@main
struct NewSwiftUILearningApp: App {
    /// App wide shared content
    ///
    /// To illustrate how to pass into the environment using the Observation framework
    @State private var shared = SharedContent()
    
    /// Library for Apple Observation Example
    @State private var library = Library()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(shared)
                .environment(library)
        }
    }
    
    init() {
      // Configure Tip's data container
      try? Tips.configure()
    }
}
