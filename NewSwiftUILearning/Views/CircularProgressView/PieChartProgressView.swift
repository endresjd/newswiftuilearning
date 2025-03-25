//
//  PieChartProgressView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 3/19/25.
//

import SwiftUI
import Charts

/// Pie Chart progress View
///
/// Shows a way to show progress by using Swift Charts to make a fancy pie chart
/// of the data points
///
/// - SeeAlso: [How to build segmented circular progress views in SwiftUI with Swift Charts](https://www.polpiella.dev/swiftui-charts-progress-views/?utm_campaign=This%2BWeek%2Bin%2BSwift&utm_medium=email&utm_source=This_Week_in_Swift_166)
struct PieChartProgressView: View {
    /// rollout progress for each day
    let portions = [
        ProgressPortion(day: 1, portion: 0.01, rolloutPercentage: 1),
        ProgressPortion(day: 2, portion: 0.01, rolloutPercentage: 2),
        ProgressPortion(day: 3, portion: 0.03, rolloutPercentage: 5),
        ProgressPortion(day: 4, portion: 0.05, rolloutPercentage: 10),
        ProgressPortion(day: 5, portion: 0.1, rolloutPercentage: 20),
        ProgressPortion(day: 6, portion: 0.3, rolloutPercentage: 50),
        ProgressPortion(day: 7, portion: 0.5, rolloutPercentage: 100)
    ]
    
    /// Current Day
    let day: Int
    
    var body: some View {
        // check if the current day is present in the portions array and extract the rollout
        // percentage. In other words, we only show the chart if the current day is within
        // the rollout period
        if let rollout = portions.first(where: { $0.day == day })?.rolloutPercentage {
            // overlay the chart with the current day and rollout percentage
            ZStack(alignment: .center) {
                // display the current day and rollout percentage in a VStack
                VStack {
                    Text("\(Int(rollout))%")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.primary)
                    Text("Day \(day) out of 7")
                        .font(.title3)
                        .foregroundStyle(.tertiary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .padding(.horizontal)
                }
                
                // create a Chart view instance with the portions array
                Chart(portions, id: \.day) { element in
                    // For each portion, we create a SectorMark, which is a piece of the pie chart with the day rollout value
                    SectorMark(
                        angle: .value("Phased Release Progress", element.portion),
                        innerRadius: .ratio(0.55),
                        angularInset: 2
                    )
                    .cornerRadius(10)
                    // set the foreground color to fill all days before the current day with purple and the rest with gray
                    .foregroundStyle(day >= element.day ? .purple : .gray.opacity(0.3))
                }
            }
            .frame(width: 250, height: 250)
        }
    }
}

#Preview {
    ScrollView {
        PieChartProgressView(day: 1)
        PieChartProgressView(day: 2)
        PieChartProgressView(day: 3)
        PieChartProgressView(day: 4)
        PieChartProgressView(day: 5)
        PieChartProgressView(day: 6)
        PieChartProgressView(day: 7)
    }
}
