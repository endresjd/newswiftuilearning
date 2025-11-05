//
//  RenameButtonExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// Shows iOS 16's `RenameButton` control.
///
/// A rename button receives its action from the environment. Use the `renameAction(_:)`
/// modifier to set the action. The system disables the button if you don’t define an
/// action.
///
/// This example will put the focus on to the `TextField` when the rename button
/// is tapped which brings up the keyboard.
///
/// - Important: This example, with the `contextMenu` is from the help.  It doesn't
///              seem to work on iOS?
/// - Experiment: See how this is really used
/// - Requires: iOS 16
struct RenameButtonExample: View {
    @State private var text = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        Form {
            Text("Text: \(text).")
            Text(isFocused ? "Focused" : "Not focused")

            TextField(text: $text) {
                Text("Prompt")
            }
            .focused($isFocused)
            .contextMenu {
                RenameButton()
            }

            RenameButton()
                .renameAction {
                    isFocused = true
                }
        }
    }
}

#Preview {
    RenameButtonExample()
}
