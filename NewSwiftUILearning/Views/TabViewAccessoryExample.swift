//
//  TabViewAccessoryExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/8/25.
//

import SwiftUI

@available(iOS 26.0, *)
struct TabViewAccessoryExample: View {
    var body: some View {
        TabView {
            Tab("Tab 1", systemImage: "1.circle") {
                List(0..<100) { i in
                    Text("Row \(i)")
                }
            }

            Tab("Tab 2", systemImage: "2.circle") {
                Text("Tab 2")
            }
        }
        .tabViewBottomAccessory {
            Text("Hello, world!")
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        TabViewAccessoryExample()
    } else {
        FutureFeatureView()
    }
}
