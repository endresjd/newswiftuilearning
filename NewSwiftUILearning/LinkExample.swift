//
//  LinkExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

struct LinkExample: View {
    var body: some View {
        Link("View Our Terms of Service", destination: URL(string: "https://www.example.com/TOS.html")!)
        .padding(.bottom)

        Link("Visit Our Site", destination: URL(string: "https://www.example.com")!)
            .environment(\.openURL, OpenURLAction { url in
                print("Open \(url)")
                return .handled
            })
    }
}

#Preview {
    LinkExample()
}
