//
//  RenameButtonExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

// A rename button receives its action from the environment. Use the renameAction(_:)
// modifier to set the action. The system disables the button if you don’t define an
// action.
struct RenameButtonExample: View {
    @State private var text = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        Form {
            TextField(text: $text) {
                Text("Prompt")
            }
            .focused($isFocused)
            .contextMenu {
                RenameButton()
                // ... your own custom actions
            }
            .renameAction { isFocused = true }
        }
    }
}

#Preview {
    RenameButtonExample()
}
