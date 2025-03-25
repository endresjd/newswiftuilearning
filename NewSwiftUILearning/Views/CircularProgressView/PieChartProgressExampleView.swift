//
//  PieChartProgressExampleView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 3/19/25.
//

import SwiftUI

struct PieChartProgressExampleView: View {
    var body: some View {
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
}

#Preview {
    PieChartProgressExampleView()
}
