//
//  DisclosureGroupExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Examples of using iOS 14's DisclosureGroup
///
/// - Experiment: Try creating a DisclosureGroup using a label instead
struct DisclosureGroupExample: View {
    struct ToggleStates {
        var oneIsOn = false
        var twoIsOn = true
    }
    @State private var toggleStates = ToggleStates()
    @State private var topExpanded: Bool = true
    
    var body: some View {
        DisclosureGroup("Items", isExpanded: $topExpanded) {
            Group {
                Toggle("Toggle 1", isOn: $toggleStates.oneIsOn)
                Toggle("Toggle 2", isOn: $toggleStates.twoIsOn)
                
                DisclosureGroup("Sub-items") {
                    Text("Sub-item 1")
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    DisclosureGroupExample()
}
