//
//  MarkdownExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/15/25.
//

import SwiftUI

/// Show ways to render text using Markdown
///
/// * Some of this markdown is using Apple’s Markdown extension syntax: ^[text](name:value, name:value, …)
/// * Some is from straight up markdown.
///
/// The markdown looks like it takes json values to customize the underlying struct -- see the morhphology examples.
///
/// - SeeAlso:
///     * [Plurals with SwiftUI](https://samwize.com/2025/04/11/plurals-with-swiftui)
///     * [How to render Markdown content in text](https://www.hackingwithswift.com/quick-start/swiftui/how-to-render-markdown-content-in-text)
///     * [Building a Localized Food-Ordering App](https://developer.apple.com/documentation/foundation/data_formatting/building_a_localized_food-ordering_app)
///     * [MarkdownDecodableAttributedStringKey](https://developer.apple.com/documentation/foundation/markdowndecodableattributedstringkey)
///     * [Morphology.swift](https://github.com/swiftlang/swift-corelibs-foundation/blob/main/Sources/Foundation/Morphology.swift)
///     * [Morphology in Swift](https://lickability.com/blog/morphology-in-swift/)
///     * [Morphology in Swift](https://www.swiftjectivec.com/morphology-in-ios-with-automatic-grammar-agreement/)
///     * [MarkdownDecodableAttributedStringKey](https://developer.apple.com/documentation/foundation/markdowndecodableattributedstringkey)
struct MarkdownExample: View {
    /// For the stepper to show how to pluralize the stepper name
    @State private var coffeeAmount = 1
    
    /// For the messages stepper
    @State private var messages = 1

    // These show examples of Apple’s Markdown extension syntax: ^[text](name:value, name:value, …)
    var body: some View {
        List {
            Section("Basic") {
                Text("This is regular text.")
                Text("This is **bold** text, this is *italic* text, and this is ***bold, italic*** text.")
                Text("~~A strikethrough example~~")
                Text("`Monospaced works too`")
                Text("Visit Apple: [click here](https://apple.com)")
            }
            
            Section("Advanced") {
                // Don't really understand
                Text("^[Text with foo & bar attributes](foo: xxx, bar: 123)")
            }
            
            // You can apply the inflect=true attribute to part of the string:
            Section("Pluralization") {
                Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 0...20)
                Stepper("^[\(messages) New Message](inflect: true)", value: $messages, in: 0...20)
            }

            Section("Hacky Pluralization") {
                ForEach(0..<3) { count in
                    Text("\(count) New Message", countToInflect: count)
                }
            }
        }
    }
}

extension Text {
    /// Create a string with proper form for 0 or more values of the string passed in
    ///
    /// As the blog post mentioned, this was figured out by actually looking at the source code
    /// for Foundation to see how it is using the json givin in the morphology parameter (?) in the
    /// markdown.
    ///
    /// - Parameters:
    ///   - text: Text.  Example: "New Message"
    ///   - countToInflect: How many there are.  1 will give "New Message", all others give "New Messages"
    ///
    /// - Important: Unclear if this is OK or it is exposing kinda hidden stuff because of the JSON.
    init(_ text: String, countToInflect: Int) {
        if countToInflect == 1 {
            self.init("^[\(text)](morphology: { number: \"one\" }, inflect: true)")
        } else {
            self.init("^[\(text)](morphology: { number: \"other\" }, inflect: true)")
        }
    }
}

#Preview {
    MarkdownExample()
}
