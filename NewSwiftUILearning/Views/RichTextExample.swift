//
//  RichTextExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/8/25.
//

import SwiftUI

/// Shows how to display a simple rich text editor.
///
/// You can get some more control over things by keeping track of current selection state
/// and then running transforms on the text based on that selection range.  See the link.
///
/// - SeeAlso: [How to use rich text editing with TextView and AttributedString](https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-rich-text-editing-with-textview-and-attributedstring)
@available(iOS 26.0, *)
struct RichTextExample: View {
    @Environment(\.fontResolutionContext) private var fontResolutionContext
    @State private var text = AttributedString("")
    @State private var selection = AttributedTextSelection()

    var body: some View {
        if #available(iOS 26, *) {
            VStack {
                TextEditor(text: $text, selection: $selection)

                HStack {
                    Button("Bold", systemImage: "bold") {
                        text.transformAttributes(in: &selection) { container in
                            let currentFont = container.font ?? .default
                            let resolved = currentFont.resolve(in: fontResolutionContext)

                            container.font = currentFont.bold(!resolved.isBold)
                        }
                    }

                    Button("Italic", systemImage: "italic") {
                        text.transformAttributes(in: &selection) { container in
                            let currentFont = container.font ?? .default
                            let resolved = currentFont.resolve(in: fontResolutionContext)

                            container.font = currentFont.italic(!resolved.isItalic)
                        }
                    }
                }
            }
        } else {
            FutureFeatureView()
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        RichTextExample()
    } else {
        FutureFeatureView()
    }
}
