//
//  SFSymbolColor.swift
//  NewSwiftUILearning
//
//  Created by Endres, John on 3/8/24.
//

import SwiftUI

/// Shows dymanic control over coloring of system symbols
///
/// Some SF Symbols support variable coloring, which means they can have different parts filled based on a fraction between 0 and 1.
///
/// - Requires: iOS 16
/// - Seealso: [How to dynamically adjust the color of an SF Symbol](https://www.hackingwithswift.com/quick-start/swiftui/how-to-dynamically-adjust-the-color-of-an-sf-symbol)
struct SFSymbolColor: View {
    @State private var value = 0.0

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "aqi.low", variableValue: value)
                Image(systemName: "wifi", variableValue: value)
                Image(systemName: "chart.bar.fill", variableValue: value)
                Image(systemName: "waveform", variableValue: value)
            }

            Slider(value: $value)
        }
        .font(.system(size: 72))
        .foregroundStyle(.blue)
        .padding()
    }
}

#Preview {
    SFSymbolColor()
}
