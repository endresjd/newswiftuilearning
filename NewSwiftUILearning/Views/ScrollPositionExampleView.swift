//
//  ScrollPositionExampleView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/13/24.
//

import SwiftUI

/// Shows how to use ScrollPosition.
///
/// The new ScrollPosition type, in pair with the scrollPosition view modifier, allows us to read
/// the precise position of a ScrollView instance. We can also use it to programmatically scroll
/// to the particular point of the scrolling content.
@available(iOS 18.0, *)
struct ScrollPositionExampleView: View {
    @State private var position = ScrollPosition(point: .zero)

    var body: some View {
        VStack {
            ScrollView {
                ForEach(1..<1000) { item in
                    Text(item.formatted())
                        .frame(maxWidth: .infinity)
                }
            }
            .scrollPosition($position)
        }

        Button("jump to top") {
            position = ScrollPosition(point: .zero)
        }
    }
}

#Preview {
    if #available(iOS 18, *) {
        ScrollPositionExampleView()
    } else {
        FutureFeatureView()
    }
}
