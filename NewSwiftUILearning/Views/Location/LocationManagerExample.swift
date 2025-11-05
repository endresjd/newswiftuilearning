//
//  LocationManagerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 12/13/23.
//

import SwiftUI

/// Gets and displays the location when the view is loaded by using the `.task` modifier from iOS 15.
///
/// LocationManager is a class in this project that puts a concurrent wrapper around the system's location
/// manager.
struct LocationManagerExample: View {
    @State private var location = "Unknown"
    @State private var error = ""

    private let locationManager = LocationManager()

    var body: some View {
        VStack {
            Text(location)
            Text(error)
                .foregroundStyle(.red)
            Spacer()
        }
        .task {
            // Gets the location or error and populates the view
            do {
                let location = try await locationManager.location

                self.location = location.description
            } catch {
                self.error = error.localizedDescription
            }
        }
    }
}

#Preview {
    LocationManagerExample()
}
