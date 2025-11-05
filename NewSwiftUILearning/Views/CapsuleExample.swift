//
//  CapsuleExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Draws a simple horizontal capsule.  iOS 13.
struct CapsuleExample: View {
    var body: some View {
        Capsule()
            .fill(.green)
            .frame(width: 100, height: 50)
    }
}

#Preview {
    CapsuleExample()
}
