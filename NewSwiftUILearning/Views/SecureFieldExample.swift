//
//  SecureFieldExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

struct SecureFieldExample: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        Form {
            TextField(
                "User name (email address)",
                text: $username
            )
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .border(Color(UIColor.separator))
            
            SecureField(
                "Password",
                text: $password
            ) {
                handleLogin(username: username, password: password)
            }
            .border(Color(UIColor.separator))
        }
    }
    
    func handleLogin(username: String, password: String) {
        print(username)
        print(password)
    }
}

#Preview {
    SecureFieldExample()
}
