//
//  GuageExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

struct LabeledGauge: View {
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
struct GuageExample: View {
    @State private var batteryLevel = 0.4

    var body: some View {
        ScrollView {
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
    }
}

#Preview {
    GuageExample()
}
