//
//  NewLocationManagerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 10/27/25.
//

import CoreLocation
import SwiftUI

struct NewLocationManagerExample: View {
    @Environment(NewLocationManager.self) private var locationManager

    var body: some View {
        ScrollView {
            Image(systemName: "globe")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .padding()

            if let error = locationManager.error {
                Text(error.localizedDescription)
                    .foregroundStyle(.red)
            } else {
                Text("\(locationManager.location?.description ?? "No Location Provided!")")
            }
        }
        .navigationTitle("Location")
        .task {
            await locationManager.requestUserAuthorization()
            await locationManager.startCurrentLocationUpdates()
        }
    }
}

#Preview {
    NewLocationManagerExample()
}
