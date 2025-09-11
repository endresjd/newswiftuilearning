//
//  ScheduledNotificationsExamples.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 9/5/25.
//

import SwiftUI
import UserNotifications
import os
import MacpluginsMacros

private struct LabeledValue: View {
    var title: String
    var value: String
    var titleWidth: CGFloat? = 120

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 12) {
            HStack {
                Spacer(minLength: 0)
                Text(title)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            .frame(width: titleWidth, alignment: .trailing)

            Text(value)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

/// Examples of how to schedule notifications
///
/// - SeeAlso: [Scheduling notifications with time, calendar, and location triggers in iOS](https://tanaschita.com/ios-local-notification-triggers/)
@OSLogger
struct ScheduledNotificationsExamples: View {
    @State private var checkAgain = false
    @State private var timeInterval = false
    @State private var specificTime = false
    @State private var location = false
    @State private var clearNotifications = false
    @Environment(SharedContent.self) private var shared
    private let notificationCenter = UNUserNotificationCenter.current()

    var body: some View {
        
        ScrollView {
            VStack(spacing: 8) {
                LabeledValue(title: "Updated", value: shared.lastUpdate.formatted(date: .omitted, time: .shortened))
                LabeledValue(title: "URL", value: shared.openedURL?.absoluteString ?? "No URL")
                LabeledValue(title: "Notifications", value: String(shared.notificationCount))
                LabeledValue(title: "Message", value: shared.message)
                LabeledValue(title: "Status", value: shared.status)
                LabeledValue(title: "Secondary", value: shared.secondaryStatus)
            }
            .padding(.bottom)
            
            VStack(spacing: 16) {
                Button("Check again") {
                    checkAgain.toggle()
                }
                
                Button("Time interval") {
                    timeInterval = true
                }
                
                Button("Specific time") {
                    specificTime = true
                }
                
                Button("Location") {
                    location = true
                }
                
                Button("Clear everything") {
                    clearNotifications = true
                }
            }
        }
        .task(id: checkAgain) {
            logger.debug("checkStatus")
            
            await shared.checkStatus()
        }
        .task(id: clearNotifications) {
            guard clearNotifications else {
                return
            }
            
            logger.debug("clearNotifications")
            
            await shared.clearAllNotifications()

            clearNotifications = false
        }
        .task(id: timeInterval) {
            guard timeInterval else {
                return
            }
            
            logger.debug("timeInterval")
            
            await shared.checkStatus()
            await shared.timeInterval()

            timeInterval = false
        }
        .task(id: specificTime) {
            guard specificTime else {
                return
            }
            
            logger.debug("timeInterval")
            
            await shared.calendarTrigger()

            specificTime = false
        }
        .task(id: location) {
            guard location else {
                return
            }
            
            logger.debug("timeInterval")
            
            await shared.locationTrigger()

            location = false
        }
    }
}

#Preview {
    ScheduledNotificationsExamples()
}

