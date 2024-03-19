//
//  ContentUnavailableViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Shows how to show a custom or preset unavailable view for iOS 17.
///
/// It is recommended to use ContentUnavailableView in situations where a view’s content cannot be 
/// displayed. That could be caused by a network error, a list without items, a search that returns no results etc.
///
/// - Requires: iOS 17
struct ContentUnavailableViewExample: View {
    var body: some View {
        ContentUnavailableView {
            Label("No Mail", systemImage: "tray.fill")
        } description: {
            Text("New mail you receive will appear here.")
        }
        
        ContentUnavailableView.search(text: "Search")
    }
}

#Preview {
    ContentUnavailableViewExample()
}
