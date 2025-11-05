//
//  GuageExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// iOS 16's `Gauge` rendered in several different styles.
///
///  A gauge is a view that shows a current level of a value in relation to a specified finite capacity, very much like a
///  fuel gauge in an automobile. Gauge displays are configurable; they can show any combination of the gauge’s
///  current value, the range the gauge can display, and a label describing the purpose of the gauge itself.
///
///  Documentation hints that this was mostly for the Watch, but the examples here show they can work for phone
///  too.
///
/// - Experiment: Make the values controled by other elements to show differences in the guages.
/// - Requires: iOS 16
struct GuageExample: View {
    @State private var batteryLevel = 0.4

    var body: some View {
        ScrollView {
            Group {
                Gauge(value: batteryLevel) {
                    Text("Battery Level")
                }
                .padding()

                LabeledGauge()

                LabeledGauge()
                    .gaugeStyle(.accessoryCircular)

                LabeledGauge()
                    .gaugeStyle(.accessoryCircularCapacity)

                LabeledGauge()
                    .gaugeStyle(.accessoryLinear)

                LabeledGauge()
                    .gaugeStyle(.accessoryLinearCapacity)
            }
            .padding(.horizontal)
        }
    }
}

private struct LabeledGauge: View {
    @State private var current = 67.0
    @State private var minValue = 0.0
    @State private var maxValue = 170.0

    var body: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Text("BPM")
        } currentValueLabel: {
            Text("\(Int(current))")
        } minimumValueLabel: {
            Text("\(Int(minValue))")
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
        }
    }
}

#Preview {
    GuageExample()
}
