//
//  TextFieldExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/15/23.
//

import SwiftUI

/// Examples of iOS 13's `TextField` control.
struct TextFieldExample: View {
    @State private var username = ""
    @FocusState private var emailFieldIsFocused: Bool
    @State private var nameComponents = PersonNameComponents()
    @State private var login = ""
    @State private var password = ""
    @State private var givenName = ""
    @State private var familyName = ""

    var body: some View {
        Form {
            Section("Simple") {
                TextField(
                    "User name (email address)",
                    text: $username
                )
                .focused($emailFieldIsFocused)
                .onSubmit {
                    print("validate")
                }
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)

                Text(username)
                    .foregroundColor(emailFieldIsFocused ? .red : .blue)
            }

            Section("Formatstyle and Name components") {
                TextField(
                    "Proper name",
                    value: $nameComponents,
                    format: .name(style: .medium)
                )
                .onSubmit {
                    print("validate")
                }
                .disableAutocorrection(true)
                .border(.secondary)

                Text(nameComponents.debugDescription)
            }

            Section("Prompts") {
                TextField(text: $login, prompt: Text("Username required")) {
                    Text("Username")
                }
                SecureField(text: $password, prompt: Text("Password required")) {
                    Text("Password")
                }
            }

            Section("No autocorrect") {
                VStack {
                    TextField(
                        "Given Name",
                        text: $givenName
                    )
                    .disableAutocorrection(true)
                    TextField(
                        "Family Name",
                        text: $familyName
                    )
                    .disableAutocorrection(true)
                }
                .textFieldStyle(.roundedBorder)
            }
        }
    }
}

#Preview {
    TextFieldExample()
}
