//
//  SharedContent.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/1/25.
//

import CoreLocation
import MacpluginsMacros
import SwiftUI
import UserNotifications
import os

/// Shared content for the whole app.
///
/// Used as an example of how to set an environment object from the app
/// using the Observation Framework and to provide notification related functions.
///
/// - SeeAlso: [Migrating from the Observable Object protocol to the Observable macro](https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro)
@OSLogger
@Observable
@MainActor
final class SharedContent: NSObject {
    var sharedText = "Hello, World!"
    var openedURL: URL?
    var notificationCount = 0
    var status = "Unknown"
    var secondaryStatus = "Unknown"
    var message = ""
    var lastUpdate = Date()
    private let notificationCenter = UNUserNotificationCenter.current()

    override init() {
        super.init()

        notificationCenter.delegate = self
    }

    deinit {
        logger.debug("SharedContent deinitialized")
    }

    /// Demonstrates safe use of withObservationTracking in Swift 6, without capturing non-Sendable values in the closure.
    ///
    /// - Important: As usual, I don't know how to use this in Swift 6.  Xcode is no help.
    func trackSharedText() {
        let currentText = sharedText // Capture value, not reference

        withObservationTracking {
            lastUpdate = Date()
            _ = sharedText
        } onChange: { [currentText] in
            // Hop back to the MainActor to access main-actor isolated state
            Task { @MainActor [self] in
                print("sharedText changed from \(currentText) to \(self.sharedText)")

                // Recursively observe again, if needed. Use a microtask to avoid stack overflow.
                trackSharedText()
            }
        }
    }

    /// Add a notification based on a trigger.
    ///
    /// - Parameters:
    ///   - title: Title for the notification
    ///   - body: Body for the notification
    ///   - trigger: Trigger for the notificaiton
    func add(title: String, body: String, trigger: UNNotificationTrigger) async {
        let content = UNMutableNotificationContent()

        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default

        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

        // Schedule the request with the system.
        do {
            try await notificationCenter.add(request)
            message = "Success"
        } catch {
            logger.error("Failed to schedule notification: \(error, privacy: .public)")
            message = error.localizedDescription
        }
    }

    /// Check the pending notification count and update the published value.
    func checkNotifications() async {
        let requests = await notificationCenter.pendingNotificationRequests()

        notificationCount = requests.count
        lastUpdate = Date()
    }

    /// Checks notification status.
    ///
    /// Fills in fields of the view to show us notification center status
    func checkStatus() async {
        let settings = await notificationCenter.notificationSettings()

        switch settings.authorizationStatus {
        case .authorized:
            status = "authorized"
        case .denied:
            status = "denied"
        case .ephemeral:
            status = "ephemeral"
        case .notDetermined:
            status = "not determined"
        case .provisional:
            status = "provisional"
        @unknown default:
            status = "@unknown default"
        }

        switch settings.alertSetting {
        case .disabled:
            secondaryStatus = "Disabled"
        case .enabled:
            secondaryStatus = "Enabled"
        case .notSupported:
            secondaryStatus = "Not supported"
        @unknown default:
            secondaryStatus = "Unplanned state"
        }

        await checkNotifications()
    }

    /// Schedule a timed notification.
    ///
    /// This shows how to fire a notification after a set number of seconds.
    /// A time interval trigger is the simplest option. It fires after a fixed amount of time has passed,
    /// making it perfect for short-term reminders or countdowns.
    func timeInterval() async {
        let settings = await notificationCenter.notificationSettings()

        guard settings.authorizationStatus == .authorized || settings.authorizationStatus == .provisional else {
            message = "Not authorized"
            logger.error("\(self.message)")

            return
        }

        let numberOfMinutes = 1
        let seconds = 60
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(numberOfMinutes * seconds), repeats: false)

        await add(title: "Time interval", body: "it's been a minute", trigger: trigger)
        await checkStatus()
    }

    /// Schedle a notification at a specific date and time.
    ///
    /// A calendar trigger allows us to schedule notifications based on specific dates and times or repeating intervals.
    /// This is ideal for recurring reminders, like daily health checks or weekly meeting reminders. For example, we
    /// can trigger a notification every morning at 7:30 with the following code
    func calendarTrigger() async {
        let settings = await notificationCenter.notificationSettings()

        guard settings.authorizationStatus == .authorized || settings.authorizationStatus == .provisional else {
            return
        }

        var dateComponents = DateComponents()

        dateComponents.hour = 7
        dateComponents.minute = 30

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        await add(title: "7:30am", body: "Not sure if hour is 24 hours or not", trigger: trigger)
        await checkStatus()
    }

    /// Schedule a notification based on location.
    ///
    /// A location trigger is a more context-aware option that fires when a user enters or exits a specified geographic region
    func locationTrigger() async {
        let settings = await notificationCenter.notificationSettings()

        guard settings.authorizationStatus == .authorized || settings.authorizationStatus == .provisional else {
            return
        }

        let point = CLLocationCoordinate2D(latitude: 40.0992294, longitude: -83.1140771)
        let region = CLCircularRegion(center: point, radius: 20 * 1000, identifier: "dublin")

        region.notifyOnEntry = false
        region.notifyOnExit = true

        let trigger = UNLocationNotificationTrigger(region: region, repeats: false)

        await add(title: "Leaving?", body: "You left Dublin?", trigger: trigger)
        await checkStatus()
    }

    /// Clear all notifications.
    func clearAllNotifications() async {
        notificationCenter.removeAllPendingNotificationRequests()
        notificationCenter.removeAllDeliveredNotifications()

        message = ""
        status = ""
        secondaryStatus = ""

        await checkStatus()
    }
}

extension SharedContent: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse
    ) async {
        logger.debug("userNotificationCenter:didReceive async")

        message = "didReceive: \(response.notification.request.content.body)"

        await checkStatus()
    }

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification
    ) async -> UNNotificationPresentationOptions {
        logger.debug("userNotificationCenter:willPresent async")

        message = "willPresent: \(notification.request.content.body)"

        await checkStatus()

        return [.banner, .list, .badge, .sound]
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor: UNNotification?) {
        logger.debug("userNotificationCenter:openSettingsFor")
        message = "openSettings?"
    }
}
