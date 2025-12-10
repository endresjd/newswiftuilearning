//
//  PathStore.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 12/10/25.
//

import Foundation
import MacpluginsMacros
import SwiftUI
import os

/// Utility to save/restore navigation path.
///
/// - SeeAlso: [Saving NavigationPath](https://www.hackingwithswift.com/quick-start/swiftui/how-to-save-and-load-navigationstack-paths-using-codable)
@OSLogger
@Observable
final class PathStore {
    private let keyName = "navigationPath"

    var path = NavigationPath() {
        didSet {
            save()
        }
    }

    init() {
        if let data = UserDefaults.standard.data(forKey: keyName),
            let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data)
        {
            path = NavigationPath(decoded)

            logger.debug("Restored navigation path")
        }
    }

    func save() {
        guard let representation = path.codable else {
            return
        }

        // Save the navigation path to user defaults
        do {
            let encodedPath = try JSONEncoder().encode(representation)

            UserDefaults.standard.set(encodedPath, forKey: keyName)

            logger.debug("Saved navigation path")
        } catch {
            logger.error("Failed to save navigation data: \(error)")
        }
    }
}
