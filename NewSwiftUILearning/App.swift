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

    /// An object that manages the app's data and state.
    ///
    /// Until we move it into the shared object above
    @State private var modelData = FlexibleHeaderModel()

    /// Library for Apple Observation Example
    @State private var library = Library()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(shared)
                .environment(library)
                .environment(modelData)
                // Keeps the current window's size for use in scrolling header calculations.
                .onGeometryChange(for: CGSize.self) { geometry in
                    geometry.size
                } action: { size in
                    print(size)
                    
                    modelData.windowSize = size
                }
        }
    }
    
    init() {
      // Configure Tip's data container
      try? Tips.configure()
    }
}
