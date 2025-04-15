//
//  TaskModifierExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/15/25.
//

import SwiftUI

/// Advanced use of the task modifier.
///
/// * Normal
/// * Parameterized
/// * Better task sleep usage
///
/// - SeeAlso: [Working With The task Modifier In SwiftUI](https://serialcoder.dev/text-tutorials/swiftui/working-with-the-task-modifier-in-swiftui/)
struct TaskModifierExample: View {
    var body: some View {
        List(TaskProfile.all) { profile in
            NavigationLink(profile.name) {
                ProfileDetailView(profileID: profile.id)
            }
        }
        .navigationTitle("Profiles")
    }
}

#Preview {
    NavigationStack {
        TaskModifierExample()
    }
}
