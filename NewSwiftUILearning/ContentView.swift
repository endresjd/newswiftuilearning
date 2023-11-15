//
//  ContentView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: ViewRouter? = nil // Nothing selected by default.

    var body: some View {
        NavigationStack {
            List(ViewRouter.allCases.sorted()) { view in
                NavigationLink(view.rawValue, value: view)
            }
            .navigationDestination(for: ViewRouter.self) { view in
                view.view
                    .navigationTitle(view.rawValue)
            }
        }
    }
}

#Preview {
    ContentView()
}
