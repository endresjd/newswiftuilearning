//
//  ScrollViewIndicatorsExample.swift
//  NewSwiftUILearning
//
//  Created by Endres, John on 3/8/24.
//

import SwiftUI

/// Shows how to hide the scroll indicators.
///
/// A list of rows large enough to require scrolling. This uses `scrollIndicators`
/// to tell the scroll view to not show the indicators.  The article says it will mostly hide
/// them.
///
/// - Remark: Sometimes this will be ignored depending on hardware conditions.  See the link.
/// - Experiment: Try out different values for the modifier.  `.never` or `.visible`, for example.
/// - Important: iOS 16 minimum
/// - SeeAlso: [How to hide the scroll indicators in ScrollView, List, and more](https://www.hackingwithswift.com/quick-start/swiftui/how-to-hide-the-scroll-indicators-in-scrollview-list-and-more)
struct ScrollViewIndicatorsExample: View {
    var body: some View {
        List(1..<100) { i in
            Text("Row \(i)")
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ScrollViewIndicatorsExample()
}
