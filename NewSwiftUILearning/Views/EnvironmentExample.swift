//
//  EnvironmentExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/1/25.
//

import SwiftUI

/// Show how to access the environment with the Observation framework.
struct EnvironmentExample: View {
    /// Shared data using Observation framework.
    ///
    /// Previously the view LibraryView retrieved a Library instance from the environment using the
    /// EnvironmentObject property wrapper. The new code, however, uses the Environment property wrapper instead
    @Environment(SharedContent.self) var shared
    
    var body: some View {
        Text(shared.sharedText)
    }
}

#Preview {
    EnvironmentExample()
        .environment(SharedContent())
}
