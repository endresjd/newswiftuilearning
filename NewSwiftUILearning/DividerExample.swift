//
//  DividerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

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
