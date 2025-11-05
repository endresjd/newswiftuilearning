//
//  SafeAreaExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/15/25.
//

import SwiftUI

/// Look at how to respect the safe area.
///
/// The safe area is the screen portion that remains unobstructed by system UI
/// elements such as the status bar, navigation bar, tab bar, Dynamic Island, and
/// home indicator.
///
/// By default, SwiftUI ensures that views are placed within this safe area to maintain
/// visibility and accessibility. However, there are cases where developers need more
/// control over how views interact with these boundaries.
///
/// - SeeAlso:
///     * [Placing UI components within the Safe Area Inset](https://www.createwithswift.com/placing-ui-components-within-the-safe-area-inset)
///     * [Adding a background to your view](https://www.createwithswift.com/placing-ui-components-within-the-safe-area-inset)
///     * [The safe area](https://www.swiftuifieldguide.com/layout/safe-area)
struct SafeAreaExample: View {
    /// Toggle going into the safe area on and off.
    @State private var ignoreSafeArea = true

    /// Show a view in the top safe area.
    @State private var showTop = true

    /// Show a view in the bottom safe area.
    @State private var showBottom = true

    /// The amount of spacing to add to the top and bottom safe areas.
    @State private var padding = 0.0

    /// Amount of spacing to give the top safe area inset view.
    @State private var topSpacing = 0.0

    /// Amount of spacing to give the bottom safe area inset view.
    @State private var bottomSpacing = 0.0

    var body: some View {
        LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom)
            .padding(.horizontal)
            .if(ignoreSafeArea) { view in
                view
                    .ignoresSafeArea()
            }
            .overlay {
                VStack {
                    Toggle("Shade Safe Area", isOn: $ignoreSafeArea)
                    Toggle("Add to top area", isOn: $showTop)
                    Toggle("Add to bottom area", isOn: $showBottom)

                    LabeledContent {
                        Stepper(value: $padding, in: 0...100, step: 5) {
                            Text(padding.formatted(.number))
                        }
                    } label: {
                        Text("Safe area padding:")
                    }

                    LabeledContent {
                        Stepper(value: $topSpacing, in: 0...100, step: 5) {
                            Text(topSpacing.formatted(.number))
                        }
                    } label: {
                        Text("Top area spacing:")
                    }

                    LabeledContent {
                        Stepper(value: $bottomSpacing, in: 0...100, step: 5) {
                            Text(bottomSpacing.formatted(.number))
                        }
                    } label: {
                        Text("Bottom area spacing:")
                    }

                    Spacer()

                    Text("Bottom of view")
                }
                .foregroundColor(.white)
                .padding(.horizontal)
            }
            .safeAreaPadding([.top, .bottom], padding)
            .if(showTop) { view in
                // allows us to insert additional content along a specified edge of a view’s safe area.
                view
                    .safeAreaInset(edge: .top, spacing: topSpacing) {
                        safeAreaComponent(text: "Top Safe Area", symbolName: "globe")
                    }
            }
            .if(showBottom) { view in
                // allows us to insert additional content along a specified edge of a view’s safe area.
                view
                    .safeAreaInset(edge: .bottom, spacing: bottomSpacing) {
                        safeAreaComponent(text: "Bottom Safe Area", symbolName: "star.fill")
                    }
            }
    }

    func safeAreaComponent(text: String, symbolName: String) -> some View {
        HStack {
            Text(text)
                .foregroundColor(.white)
            Image(systemName: symbolName)
                .foregroundColor(.yellow)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.black.opacity(0.3))
    }
}

#Preview {
    SafeAreaExample()
}
