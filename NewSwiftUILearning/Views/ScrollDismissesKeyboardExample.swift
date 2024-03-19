//
//  ScrollDismissesKeyboardExample.swift
//  NewSwiftUILearning
//
//  Created by Endres, John on 3/8/24.
//

import SwiftUI

/// Shows how to controll keyboard dismissal
///
/// SwiftUI’s scrollDismissesKeyboard() modifier gives us precise control over how the keyboard should dismiss 
/// when the user scrolls around.
///
/// For example, we could place a TextField and TextEditor into a scroll view, and have them both dismiss the 
/// keyboard interactively like in this example.
///
/// - Remark: This example does not seem to dismiss the way I would expect.
/// - Experiment: Try out different values for the modifier.  `.immediate`, for example.
/// - Requires: iOS 16
/// - Seealso: [How to dismiss the keyboard when the user scrolls](https://www.hackingwithswift.com/quick-start/swiftui/how-to-dismiss-the-keyboard-when-the-user-scrolls)
struct ScrollDismissesKeyboardExample: View {
    @State private var username = "Anonymous"
    @State private var bio = ""

    var body: some View {
        ScrollView {
            VStack {
                TextField("Name", text: $username)
                    .textFieldStyle(.roundedBorder)
                TextEditor(text: $bio)
                    .frame(height: 400)
                    .border(.quaternary, width: 1)
            }
            .padding(.horizontal)
        }
        .scrollDismissesKeyboard(.interactively)
    }
}

#Preview {
    ScrollDismissesKeyboardExample()
}
