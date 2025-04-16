//
//  LabeledContentExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Examples of how to attach a label to a value-bearing view
///
/// Shows basic usage of `LabeledContent`along with existing and new content
/// styles defined above.
///
/// The instance’s content represents a read-only or read-write value, and its label identifies or describes
/// the purpose of that value. The resulting element has a layout that’s consistent with other framework controls
/// and automatically adapts to its container, like a form or toolbar. Some styles of labeled content also apply
/// styling or behaviors to the value content, like making Text views selectable.
///
/// - Note: The Stepper one is interesting here.  Part of it lives in the label.
/// - Requires: iOS 16
struct LabeledContentExample: View {
    @State private var value = 0.0

    var body: some View {
        Form {
            LabeledContent("Label", value: "Content")

            LabeledContent(
                "Number",
                value: 100.0,
                format: .number.precision(.fractionLength(0))
            )
            .font(.callout)
            
            LabeledContent {
                Stepper(value: $value, in: 0...10.0) {
                    Text(value.formatted(.number))
                }
            } label: {
                Text("Count")
            }

            LabeledContent("Label 1", value: "Content")
                .labeledContentStyle(.accented)

            LabeledContent("Label 2", value: "Content")
                .labeledContentStyle(.vertical)
            
            LabeledContent("Label 3", value: "labelsHidden Content")
                .labelsHidden()
        }
    }
}

/// Applies the system's accent color to the content of the label
///
/// - Requires: iOS 16
private struct AccentedColorLabeledContentStyle: LabeledContentStyle {
    func makeBody(configuration: Configuration) -> some View {
        LabeledContent(configuration)
            .foregroundColor(.accentColor)
    }
}

private extension LabeledContentStyle where Self == AccentedColorLabeledContentStyle {
    /// Convenience property to create an accented label style
    ///
    /// - Requires: iOS 16
    static var accented: AccentedColorLabeledContentStyle {
        .init()
    }
}

/// A Label style whose contents are arranged vertically instead of horizontally
///
/// - Requires: iOS 16
private struct VerticalLabeledContentStyle: LabeledContentStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
    }
}

private extension LabeledContentStyle where Self == VerticalLabeledContentStyle {
    /// Convenience property to create a vertical label style
    ///
    /// - Requires: iOS 16
    static var vertical: VerticalLabeledContentStyle {
        .init()
    }
}

#Preview {
    LabeledContentExample()
}
