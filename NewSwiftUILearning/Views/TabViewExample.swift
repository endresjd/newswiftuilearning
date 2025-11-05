//
//  TabViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// iOS 13's `TabView` example with badges.
struct TabViewExample: View {
    var body: some View {
        TabView {
            Text("Received")
                .badge(2)
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }

            Text("Sent")
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }

            Text("Account")
                .badge("!")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
        }
    }
}

#Preview {
    TabViewExample()
}
