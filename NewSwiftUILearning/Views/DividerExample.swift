//
//  DividerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Shows iOS 13's Divders in different orientations.
struct DividerExample: View {
    var body: some View {
        VStack {
            Text("one")
            Divider()
            Text("one")
            Divider()
            Text("one")
        }
        
        HStack {
            Text("one")
            Divider()
            Text("one")
            Divider()
            Text("one")
        }
    }
}

#Preview {
    DividerExample()
}
