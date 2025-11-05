//
//  LocationManager.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 12/13/23.
//

import CoreLocation
import Foundation

/// Concurrent wrapper around Location Manager for getting the current location.
///
/// Has 2 functions -- request authorization and the concurrent `currentLocation`
/// property to return the current location, if known.
class LocationManager: NSObject {
    /// Instance of the LocationManager from the system.  An instance of this class will
    /// be the delegate to handle events from CLLocationManager
    private let locationManager = CLLocationManager()

    /// Bridging instance between the delegate/callback code and Swift.
    private var continuation: CheckedContinuation<CLLocation, any Error>?

    /// Either returns the current location of the device or throws an error with information
    /// about why it couldn't be determined.
    @MainActor
    var location: CLLocation {
        get async throws {
            // Gets rid of a concurrency warning becasue the change is now isolated
            // to this block
            locationManager.delegate = self

            return try await withCheckedThrowingContinuation { continuation in
                self.continuation = continuation

                locationManager.requestLocation()
            }
        }
    }

    override init() {
        super.init()
    }

    /// Uses the underlying CLLocationManager to request an "When in use" authorization for
    /// getting the location.
    func requestWhenInUseAuthorization() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            return
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    /// Gets the first location returned in the array and feeds that to the continuation, and then
    /// shuts down the async wrapper for this.
    /// - Parameters:
    ///   - manager: current system location manager
    ///   - locations: array of locations return from `manager`
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            continuation?.resume(returning: lastLocation)

            continuation = nil
        }
    }

    /// Notes the error received from the location manager and feeds that to the continuation.
    /// After that the async wrapper is cleared
    /// - Parameters:
    ///   - manager: current system location manager
    ///   - error: error returned when trying to determine location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        continuation?.resume(throwing: error)

        continuation = nil
    }
}
