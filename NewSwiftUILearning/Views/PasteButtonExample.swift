//
//  PasteButtonExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// Shows how to use the system paste button.
///
/// Use a paste button when you want to provide a button for pasting items from the system pasteboard into your app. The
/// system provides a button appearance and label appropriate to the current environment.
///
/// This shows 3 ways to put the button in.  The contents of the pasteboard are routed based on how you handle the
/// data in the closure.
///
/// - Experiment: See if you can find examples of the right way to use this.
/// - Requires: iOS 16
/// - Seealso: [How to let the user paste data into your app](https://www.hackingwithswift.com/quick-start/swiftui/how-to-let-the-user-paste-data-into-your-app)
struct PasteButtonExample: View {
    @State private var pastedText: String = ""

    var contents: String {
        pastedText.isEmpty ? " " : pastedText
    }

    var body: some View {
        VStack {
            HStack {
                PasteButton(payloadType: String.self) { strings in
                    pastedText = strings[0]
                }

                PasteButton(payloadType: String.self) { strings in
                    pastedText = strings[0]
                }
                .labelStyle(.iconOnly)

                PasteButton(payloadType: String.self) { strings in
                    pastedText = strings[0]
                }
                .labelStyle(.iconOnly)
                .tint(.black)
            }

            Divider()

            Text(contents)

            Divider()

            Spacer()
        }
    }
}

#Preview {
    PasteButtonExample()
}
