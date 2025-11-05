//
//  EntryMacroView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/13/24.
//

import SwiftUI

// Creates an environment values, transaction, container values, or focused values entry.
extension EnvironmentValues {
    /// Integer passed down to subviews.
    @Entry var entryExampleValue = 10

    /// A binding to a Bool that indicates if a sheet with a string should be shown.
    @Entry var showString: Binding<Bool>?
}

struct SubView: View {
    @Environment(\.entryExampleValue) private var value: Int
    @Environment(\.showString) private var showString: Binding<Bool>?

    var body: some View {
        VStack {
            Text("The value is \(value)")

            if let showString {
                Button("Show string") {
                    showString.wrappedValue = true
                }
            }
        }
    }
}

struct EntryMacroView: View {
    @State private var isPresented = false

    var body: some View {
        SubView()
            .environment(\.entryExampleValue, 42)

        Divider()

        SubView()

        Divider()

        SubView()
            .environment(\.entryExampleValue, 100)
            .environment(\.showString, $isPresented)
            .fullScreenCover(isPresented: $isPresented) {
                Text("John")

                Button("OK") {
                    isPresented = false
                }
            }
    }
}

#Preview {
    EntryMacroView()
}
