//
//  LocationManagerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 12/13/23.
//

import SwiftUI

struct LocationManagerExample: View {
    private var locationManager = LocationManager()
    @State private var location = "Unknown"
    @State private var error = ""

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
