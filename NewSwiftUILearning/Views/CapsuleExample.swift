//
//  CapsuleExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

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
