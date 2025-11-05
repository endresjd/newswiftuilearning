//
//  SectionExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// Shows iOS 13's `Section` view.
///
/// Use Section instances in views like List, Picker, and Form to organize content into
/// separate sections
struct SectionExample: View {
    var body: some View {
        List {
            Section(header: Text("Header")) {
                Text("Row")
            }

            Section(header: Text("Header")) {
                Text("Row")
            }
            .headerProminence(.increased)

            Section(header: Text("Other tasks"), footer: Text("End")) {
                Text("Row 1")
                Text("Row 2")
                Text("Row 3")
            }
        }
    }
}

#Preview {
    SectionExample()
}
