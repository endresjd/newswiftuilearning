//
//  ProgressViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// A collection of examples of iOS 14's `ProgressView`
///
/// Use a progress view to show that a task is incomplete but advancing '
/// toward completion. A progress view can show both determinate (percentage
/// complete) and indeterminate (progressing or not) types of progress.
struct ProgressViewExample: View {
    @State private var progress = 0.5
    let workoutDateRange = Date()...Date().addingTimeInterval(5*60)

    var body: some View {
        List {
            VStack {
                ProgressView(value: progress)
                Button("More") {
                    progress += 0.05
                }
            }
            
            ProgressView()
            
            // You can also create a progress view that covers a closed range of
            // Date values. As long as the current date is within the range, the
            // progress view automatically updates, filling or depleting the
            // progress view as it nears the end of the range
            ProgressView(timerInterval: workoutDateRange) {
                Text("Workout")
            }
            
            VStack {
                ProgressView(value: 0.25) { Text("25% progress") }
                ProgressView(value: 0.75) { Text("75% progress") }
            }
            .progressViewStyle(PinkBorderedProgressViewStyle())

            // On MacOS this will be static, otherwise it's
            // indeterminate -- as if progressViewStyle wasn't given.
            ProgressView(value: progress)
                .progressViewStyle(.circular)

            ProgressView(value: progress)
                .progressViewStyle(.linear)
        }
    }
}

private struct PinkBorderedProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .padding(4)
            .border(.pink, width: 3)
            .cornerRadius(4)
    }
}

#Preview {
    ProgressViewExample()
}
