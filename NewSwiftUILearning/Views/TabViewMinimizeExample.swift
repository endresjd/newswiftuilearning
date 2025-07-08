//
//  TabViewMinimizeExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/8/25.
//

import SwiftUI

@available(iOS 26.0, *)
struct TabViewMinimizeExample: View {
    var body: some View {
         TabView {
             Tab("Numbers", systemImage: "number") {
                 ScrollView {
                    ForEach(0 ..< 50) { index in
                        Text("\(index)")
                            .padding()
                    }
                 }
             }
             
             Tab("Alerts", systemImage: "bell") {
                 Text("Example Text")
             }
         }
         .tabBarMinimizeBehavior(.onScrollDown)
    }
}

private struct ExampleView: View {
    var body: some View {
        Text("Example Text")
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        TabViewMinimizeExample()
    } else {
        FutureFeatureView()
    }
}
