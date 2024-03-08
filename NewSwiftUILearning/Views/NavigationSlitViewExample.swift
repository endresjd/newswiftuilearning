//
//  NavigationSplitViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Show a simple split view until I understand more.
///
/// You create a navigation split view with two or three columns, and typically
/// use it as the root view in a Scene. People choose one or more items in a
/// leading column to display details about those items in subsequent columns.
///
/// Unsure how to make this work right on a phone.  It collapses into a stack
/// but the stack doesn't show row indicators (chevrons) or become part of
/// the existing navigation stack.
///
/// At narrow size classes, such as on iPhone or Apple Watch, a navigation split
/// view collapses into a single stack. Typically SwiftUI automatically chooses
/// the view to show on top of this single stack, based on the content of the
/// split view’s columns
///
/// - Important: iOS 16 minimum
/// - SeeAlso: [NavigationSplitView](https://developer.apple.com/documentation/swiftui/navigationsplitview)
struct NavigationSplitViewExample: View {
    @State private var selection: ViewRouter? = nil // Nothing selected by default.

    var body: some View {
        NavigationSplitView {
            List(ViewRouter.allCases, id: \.self, selection: $selection) { view in
                Text(view.name)
            }
        } detail: {
            NavigationStack {
                selection?.view
            }
        }
    }
}

#Preview {
    NavigationSplitViewExample()
}
