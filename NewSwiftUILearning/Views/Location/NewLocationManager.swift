//
//  NewLocationManager.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 10/27/25.
//

import CoreLocation
import Foundation
import MacpluginsMacros
import os

/// NewLocationManager.
///
/// Provides a simple way to request user authorization for location services and start receiving location updates.
///
/// - SeeAlso: [new location](https://holyswift.app/the-new-way-to-get-current-user-location-in-swiftu-tutorial/)
/// - SeeAlso: [wwdc](https://wwdcnotes.com/documentation/wwdcnotes/wwdc23-10180-discover-streamlined-location-updates/)
@OSLogger
@Observable
@MainActor
final class NewLocationManager {
    /// Currently provided location.
    ///
    /// Location updated by the `startCurrentLocationUpdates` method as it monitors
    /// the `liveUpdates()` stream.
    var location: CLLocation? = nil

    /// Last error encountered.
    var error: (any Error)?

    /// Last location update received.
    var update: CLLocationUpdate.Updates.Iterator.Element?

    /// System location manager.
    ///
    /// Current instance of the location manager that provides information that this class
    /// provides.
    private let locationManager = CLLocationManager()

    /// Loop status.
    ///
    /// To set this instance know if it's streaming information currently or not.
    private var working = false

    /// Request authorization.
    ///
    /// This method requests user authorization for location services. The method is asynchronous and will throw an error if the user denies authorization.
    func requestUserAuthorization() async {
        locationManager.requestWhenInUseAuthorization()
    }

    /// Start getting updates.
    ///
    /// This method starts receiving location updates from the CLLocationManager object.
    func startCurrentLocationUpdates() async {
        guard !working else {
            logger.debug("Already streaming")

            return
        }

        logger.info("Starting updates")

        do {
            defer {
                working = false
            }

            working = true

            for try await update in CLLocationUpdate.liveUpdates() {
                logger.debug("Got new location update")

                self.update = update

                logger.debug("accuracyLimited: \(update.accuracyLimited ? "Limited" : "Full")")
                logger.debug("authorizationDenied: \(update.authorizationDenied)")
                logger.debug("authorizationDeniedGlobally: \(update.authorizationDeniedGlobally)")
                logger.debug("authorizationRequestInProgress: \(update.authorizationRequestInProgress)")
                logger.debug("authorizationRestricted: \(update.authorizationRestricted)")
                logger.debug("insufficientlyInUse: \(update.insufficientlyInUse)")
                logger.debug("location: \(update.location)")
                logger.debug("locationUnavailable: \(update.locationUnavailable)")
                logger.debug("serviceSessionRequired: \(update.serviceSessionRequired)")
                logger.debug("stationary: \(update.stationary)")

                // To stop updates break out of the for loop.  This is
                // from the wwdc link.
                if update.stationary {
                    logger.info("location is stationary, exiting loop")
                    break
                }

                guard let location = update.location else {
                    logger.debug("No location provided")

                    break
                }

                logger.debug("Location is: \(location)")

                self.location = location
            }

            logger.info("Updates ended")
        } catch {
            logger.error("Error getting updates: \(error)")

            self.error = error
        }
    }
}
