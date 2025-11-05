//
//  TimelineViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/15/23.
//

import SwiftUI

/// Shows iOS 15's `TimelineView`.
///
/// A view that updates according to a schedule that you provide. A timeline view acts as a container with no
/// appearance of its own. Instead, it redraws the content it contains at scheduled points in time.
///
/// - SeeAlso: [TimelineView](https://swiftwithmajid.com/2022/05/18/mastering-timelineview-in-swiftui/)
struct TimelineViewExample: View {
    var body: some View {
        Form {
            Text("A view that updates according to a schedule that you provide")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            LabeledContent {
                TimelineView(.animation) { context in
                    let date = context.date

                    // Candence is how often this view is being updated
                    let value = context.cadence <= .live ? nanosValue(for: date) : secondsValue(for: date)
                    let number = value * 60

                    Circle()
                        .trim(from: 0, to: value)
                        .stroke(lineWidth: 5.0)
                        .foregroundColor(.blue)
                        .frame(width: 200, height: 200)
                        .overlay {
                            Text("\(number.formatted(.number.rounded(rule: .up, increment: 1)))")
                        }
                }
            } label: {
                Text("Simple")
                Text("Animation with cadence")
            }

            LabeledContent {
                Section("Schedulers") {
                    TimelineView(.periodic(from: .now, by: 5)) { context in
                        let value = secondsValue(for: context.date)
                        let number = value * 60

                        Circle()
                            .trim(from: 0, to: value)
                            .stroke(lineWidth: 5.0)
                            .foregroundColor(.blue)
                            .frame(width: 200, height: 200)
                            .overlay {
                                Text("\(number.formatted(.number.rounded(rule: .up, increment: 1)))")
                            }
                    }
                }
            } label: {
                Text("Schedulers")
                Text("5 second intervals")
            }
        }
    }

    private func secondsValue(for date: Date) -> Double {
        let seconds = Calendar.current.component(.second, from: date)

        return Double(seconds) / 60
    }

    private func nanosValue(for date: Date) -> Double {
        let seconds = Calendar.current.component(.second, from: date)
        let nanos = Calendar.current.component(.nanosecond, from: date)

        return Double(seconds * 1_000_000_000 + nanos) / 60_000_000_000
    }
}

#Preview {
    TimelineViewExample()
}
