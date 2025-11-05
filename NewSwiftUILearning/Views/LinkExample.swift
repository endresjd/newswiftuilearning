//
//  LinkExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// iOS 14's Link views where one is handled normally and the other is intercepted.
///
/// This shows how to use the control for navigating to a URL.  Part of this also
/// shows how to modify the environments openURL property to take a
/// different action.  In this case, it just prints the URL that would normally
/// have been opened.
struct LinkExample: View {
    var body: some View {
        if let url = URL(string: "https://www.example.com/TOS.html") {
            Link("View Our Terms of Service", destination: url)
                .padding(.bottom)
        }

        if let url = URL(string: "https://www.example.com") {
            Link("Visit Our Site", destination: url)
                .environment(
                    \.openURL,
                    OpenURLAction { url in
                        print("Open \(url)")
                        return .handled
                    }
                )
        }
    }
}

#Preview {
    LinkExample()
}
