//
//  NavigationViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Simple NavigationView and NavigationLink from iOS 13.
///
/// - Warning: iOS 17 deprecated these views
struct NavigationViewExample: View {
    let values = ["one", "two", "three"]

    var body: some View {
        NavigationView {
            List(values, id: \.self) { value in
                NavigationLink(value, destination: Text(value))
            }

            Text("Select a word")
        }
    }
}

#Preview {
    NavigationViewExample()
}
