//
//  CircleExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

struct CircleExample: View {
    var body: some View {
        Circle()
            .fill(.blue)
            .frame(width: 200, height: 200)
    }
}

#Preview {
    CircleExample()
}
