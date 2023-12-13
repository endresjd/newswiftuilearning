//
//  LabeledContentExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

struct AccentedLabeledContentStyle: LabeledContentStyle {
    func makeBody(configuration: Configuration) -> some View {
        LabeledContent(configuration)
            .foregroundColor(.accentColor)
    }
}

extension LabeledContentStyle where Self == AccentedLabeledContentStyle {
    static var accented: AccentedLabeledContentStyle { .init() }
}

struct VerticalLabeledContentStyle: LabeledContentStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
    }
}

extension LabeledContentStyle where Self == VerticalLabeledContentStyle {
    static var vertical: VerticalLabeledContentStyle { .init() }
}

// The instance’s content represents a read-only or read-write value, and its
// label identifies or describes the purpose of that value. The resulting
// element has a layout that’s consistent with other framework controls
// and automatically adapts to its container, like a form or toolbar. Some
// styles of labeled content also apply styling or behaviors to the value
// content, like making Text views selectable
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
            
            LabeledContent {
                Stepper(value: $value, in: 0...10.0) {
                    Text(value.formatted(.number))
                }
            } label: {
                Text("Count")
            }

            LabeledContent("Label", value: "Content")
                .labeledContentStyle(.accented)

            LabeledContent("Label", value: "Content")
                .labeledContentStyle(.vertical)
            
            LabeledContent("Label", value: "labelsHidden Content")
                .labelsHidden()
        }
    }
}

#Preview {
    LabeledContentExample()
}
