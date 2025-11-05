//
//  InAppBrowserExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/8/25.
//

import SwiftUI

@available(iOS 26.0, *)
struct InAppBrowserExample: View {
    @Environment(\.openURL) var openURL

    var body: some View {
        if let url = URL(string: "https://www.apple.com") {
            Button("Visit Apple") {
                openURL(url, prefersInApp: true)
            }
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        InAppBrowserExample()
    } else {
        FutureFeatureView()
    }
}
