//
//  FixedWidthLabelIconExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/8/25.
//

import SwiftUI

/// Shows how to set the width reserved for icons in labels.
///
/// - SeeAlso: [How to give label icons a fixed width](https://www.hackingwithswift.com/quick-start/swiftui/how-to-give-label-icons-a-fixed-width)
@available(iOS 26, *)
struct FixedWidthLabelIconExample: View {
    /// Adjustable width.
    ///
    /// The current default doesn't take dynamic text size into account, so this is to make the
    /// proper size adjustments.
    @ScaledMetric private var iconWidth = 50.0

    var body: some View {
        VStack {
            Button("Example", systemImage: "plus") { }
            Button("Example", systemImage: "envelope.front") { }
        }
        .font(.largeTitle)
        .labelReservedIconWidth(iconWidth)
    }
}

#Preview {
    if #available(iOS 26, *) {
        FixedWidthLabelIconExample()
    } else {
        FutureFeatureView()
    }
}
