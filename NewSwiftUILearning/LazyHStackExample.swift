//
//  LazyHStackExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

// The stack is “lazy,” in that the stack view doesn’t create items until it
// needs to render them onscreen
struct LazyHStackExample: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 10) {
                ForEach(1...100, id: \.self) {
                    Text("Column \($0)")
                }
            }
        }
    }
}

#Preview {
    LazyHStackExample()
}
