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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
      // Configure Tip's data container
      try? Tips.configure()
    }
}
