//
//  ContentUnavailableViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

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
