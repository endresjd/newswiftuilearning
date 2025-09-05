//
//  ScheduledNotificationsExamples.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 9/5/25.
//

import SwiftUI
import UserNotifications
import CoreLocation
import os
import MacpluginsMacros

/// Examples of how to schedule notifications
///
/// - SeeAlso: [Scheduling notifications with time, calendar, and location triggers in iOS](https://tanaschita.com/ios-local-notification-triggers/)
@OSLogger
struct ScheduledNotificationsExamples: View {
    @State private var status = "Unknown"
    
    var body: some View {
        ScrollView {
            Text("Status: \(status)")
        }
        .task {
            await checkStatus()
        }
    }
    
    /// Checks notification status
    ///
    /// Fills in fields of the view to show us notification center status
    func checkStatus() async {
        let center = UNUserNotificationCenter.current()
        let settings = await center.notificationSettings()
        
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
    }
    
    /// Schedule a timed notification
    ///
    /// This shows how to fire a notification after a set number of seconds.
    /// A time interval trigger is the simplest option. It fires after a fixed amount of time has passed,
    /// making it perfect for short-term reminders or countdowns.
    func timeIntervale() {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10 * 60, repeats: false)
    }
    
    /// Schedle a notification at a specific date and time
    ///
    /// A calendar trigger allows us to schedule notifications based on specific dates and times or repeating intervals.
    /// This is ideal for recurring reminders, like daily health checks or weekly meeting reminders. For example, we
    /// can trigger a notification every morning at 7:30 with the following code
    func calendarTrigger() {
        var dateComponents = DateComponents()

        dateComponents.hour = 7
        dateComponents.minute = 30

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
    }
    
    /// Schedule a notification based on location
    ///
    /// A location trigger is a more context-aware option that fires when a user enters or exits a specified geographic region
    func locationTrigger() {
        let center = CLLocationCoordinate2D(latitude: 51.3396955, longitude: 12.3730747)
        let region = CLCircularRegion(center: center, radius: 20 * 1000, identifier: "leipzig")

        region.notifyOnEntry = false
        region.notifyOnExit = true

        let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
    }
}

#Preview {
    ScheduledNotificationsExamples()
}
