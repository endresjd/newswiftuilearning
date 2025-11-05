//
//  NewSwiftUILearningApp.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import MacpluginsMacros
import SwiftUI
import TipKit
import os

/// Main entry point.
@OSLogger
@main
struct NewSwiftUILearningApp: App {
    /// App wide shared content.
    ///
    /// To illustrate how to pass into the environment using the Observation framework
    @State private var shared = SharedContent()

    /// An object that manages the app's data and state.
    ///
    /// Until we move it into the shared object above
    @State private var modelData = FlexibleHeaderModel()

    /// Library for Apple Observation Example.
    @State private var library = Library()

    /// Monitor for location changes.
    @State private var location = NewLocationManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(shared)
                .environment(library)
                .environment(modelData)
                .environment(location)
                // Keeps the current window's size for use in scrolling header calculations.
                .onGeometryChange(for: CGSize.self) { geometry in
                    geometry.size
                } action: { size in
                    modelData.windowSize = size
                }
                .onOpenURL { url in
                    // This modifier is for universal links.  Needs to have project settings
                    // modified to support the URL.  (TODO: do this)
                    logger.debug("onOpenURL: \(url.absoluteString)")

                    shared.openedURL = url
                }
                .task {
                    let center = UNUserNotificationCenter.current()

                    do {
                        // provisional: The ability to post noninterrupting notifications provisionally to the Notification Center.
                        // This wont ask for permission immediately.  It will do it when a notification comes in.
                        try await center.requestAuthorization(options: [.alert, .sound, .badge, .provisional])
                    } catch {
                        logger.error("Failed to request authorization: \(error)")
                    }
                }
                .task {
                    await location.requestUserAuthorization()
                    await location.startCurrentLocationUpdates()
                }
        }
    }

    init() {
        // Configure Tip's data container
        try? Tips.configure()
    }
}
