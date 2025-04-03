//
//  EntryMacroView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/13/24.
//

import SwiftUI

// Creates an environment values, transaction, container values, or focused values entry
extension EnvironmentValues {
    @Entry var entryExampleValue = 10
}

struct SubView: View {
    @Environment(\.entryExampleValue) private var value: Int
    
    var body: some View {
        Text("The value is \(value)")
    }
}

struct EntryMacroView: View {
    var body: some View {
        SubView()
            .environment(\.entryExampleValue, 42)

        SubView()
    }
}

#Preview {
    EntryMacroView()
}
