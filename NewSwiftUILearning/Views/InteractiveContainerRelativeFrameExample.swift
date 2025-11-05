//
//  ScrollTargetBehaviorExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/16/25.
//

import SwiftUI

/// Shows how different scrollTargetBehavior and containerRelativeFrame affect view scrolling.
///
/// - SeeAlso:
///     * [Implementing Custom Paging](https://fatbobman.com/en/posts/mastering-swiftui-scrolling-implementing-custom-paging)
///     * [New Features of ScrollView in SwiftUI 5](https://fatbobman.com/en/posts/new-features-of-scrollview-in-swiftui5/)
struct InteractiveContainerRelativeFrameExample: View {
    /// Choices for the scrolling behavior picker.
    private enum Behavior: String, CaseIterable {
        case paging = "Paging"
        case aligned = "View Aligned"
        case byOne = "View Aligned by One"
    }

    private enum ExampleAlignment: String, CaseIterable {
        case center
        case leading
        case trailing
        case top
        case bottom
        case topLeading = "Top Leading"

        var value: Alignment {
            switch self {
            case .center:
                return .center
            case .leading:
                return .leading
            case .trailing:
                return .trailing
            case .top:
                return .top
            case .bottom:
                return .bottom
            case .topLeading:
                return .topLeading
            }
        }
    }

    private enum ExampleAxis: String, CaseIterable {
        case horizontal
        case vertical
        case both

        var value: Axis.Set {
            switch self {
            case .horizontal:
                return .horizontal
            case .vertical:
                return .vertical
            case .both:
                return [.horizontal, .vertical]
            }
        }
    }

    /// Selected behavior choice.
    @State private var selectedBehavior = Behavior.paging

    /// Selected alignment choice.
    @State private var alignment = ExampleAlignment.center

    /// Selected axis choice.
    @State private var axis = ExampleAxis.horizontal

    /// Spacing for the frame.
    @State private var spacing = 0

    /// Spacing for the frame.
    @State private var stackSpacing = 0

    /// Whether to force a height for the view external to this modifier.
    @State private var fixedHeight = true

    /// Whether to force a height for the ScrollView.
    @State private var fixedHeightScrollView = true

    /// Whether to force a height for the ScrollView.
    @State private var showBorder = true

    /// Whether to turn on .scrollTargetLayout(isEnabled: isEnabled).
    ///
    /// One of the blog posts above says this is required when the target behavior
    /// is .viewAligned.  Observation shows that .viewAligned. .paging will scroll
    /// one full view width at a time.
    @State private var layoutEnable = false

    /// Count value for the frame.
    ///
    /// This is how many views are shown at the same time in the stack
    /// in this case.
    @State private var count = 1

    /// Span value for the frame.
    ///
    /// How many elements in the scrollview this takes up.
    /// This is the opposite of count, so if this was 2 and count is 1 then
    /// the element being shown would only show half at a time.
    @State private var span = 1

    /// Value for content margins.
    @State private var margins = 0

    /// Padding to put around the element in the scroll view.
    @State private var horizontalPadding = 0.0

    /// Scrolling behavior to pass to scrollTargetBehavior.
    ///
    /// - Important: Using this as a parameter to .scrollTargetBehavior causes an error.  Unsure why.
    private var behavior: any ScrollTargetBehavior {
        switch selectedBehavior {
        case .paging:
            return .paging
        case .aligned, .byOne:
            return .viewAligned
        }
    }

    @ViewBuilder
    var body: some View {
        Form {
            EnumPicker(title: "Behavior", sorted: false, selection: $selectedBehavior)
            EnumPicker(title: "Alignment", sorted: true, capitalized: true, selection: $alignment)
            EnumPicker(title: "Axis", sorted: true, capitalized: true, selection: $axis)
            Toggle("Fixed height", isOn: $fixedHeight)
            Toggle("Fixed height Scrollview", isOn: $fixedHeightScrollView)
            Toggle("Show border", isOn: $showBorder)
            Toggle("Layout enable", isOn: $layoutEnable)

            LabeledContent {
                Stepper(value: $margins, in: -10...10) {
                    Text(margins.formatted(.number))
                }
            } label: {
                Text("Content Margins:")
            }

            LabeledContent {
                Stepper(value: $horizontalPadding, in: -10...10) {
                    Text(horizontalPadding.formatted(.number))
                }
            } label: {
                Text("Horizontal Padding:")
            }

            LabeledContent {
                Stepper(value: $stackSpacing, in: 0...10) {
                    Text(stackSpacing.formatted(.number))
                }
            } label: {
                Text("Stack spacing:")
            }

            LabeledContent {
                Stepper(value: $count, in: 0...10) {
                    Text(count.formatted(.number))
                }
            } label: {
                Text("Count:")
            }

            LabeledContent {
                Stepper(value: $span, in: 0...10) {
                    Text(span.formatted(.number))
                }
            } label: {
                Text("Span:")
            }

            LabeledContent {
                Stepper(value: $spacing, in: -10...10) {
                    Text(spacing.formatted(.number))
                }
            } label: {
                Text("Spacing:")
            }

            ScrollView(.horizontal) {
                LazyHStack(spacing: CGFloat(stackSpacing)) {
                    ForEach(0..<10) { page in
                        //                        Rectangle()
                        //                            .fill(.background)
                        //                            .overlay {
                        //                                // ROFL: Use the overlay modifier when you want the modified view to dominate the layout.
                        //                                Text(page, format: .number)
                        //                                    .font(.title)
                        //                                    .foregroundStyle(.red)
                        //                                    .padding()
                        //                                    .border(.green, width: 2)
                        //                            }
                        Text(page, format: .number)
                            .font(.title)
                            .foregroundStyle(.red)
                            .padding()
                            .border(.green, width: 2)
                            .if(fixedHeight) { view in
                                view
                                    .frame(height: 200)
                            }
                            .containerRelativeFrame(
                                axis.value,
                                count: count,
                                span: span,
                                spacing: CGFloat(spacing),
                                alignment: alignment.value
                            )
                            .if(showBorder) { view in
                                view
                                    .border(.gray, width: 2)
                            }
                            .padding(.horizontal, horizontalPadding)
                    }
                }
                .scrollTargetLayout(isEnabled: layoutEnable)
                .if(fixedHeightScrollView) { view in
                    view
                        .frame(height: 200)
                }
            }
            .if(selectedBehavior == .paging) { view in
                view
                    .scrollTargetBehavior(.paging)
            }
            .if(selectedBehavior == .aligned) { view in
                view
                    .scrollTargetBehavior(.viewAligned)
            }
            .if(selectedBehavior == .byOne) { view in
                view
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .alwaysByOne))
            }
            // Don't know why this fails: .scrollTargetBehavior(behavior)
            .contentMargins(.horizontal, CGFloat(margins), for: .scrollContent)
        }
    }
}

#Preview {
    InteractiveContainerRelativeFrameExample()
}
