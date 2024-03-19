//
//  LazyVStackExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Vertically scrolling rows of words using iOS 14's LazyHStack
///
/// A container view that arranges its child views in a stack that grows
/// verticallly, creating items only as needed
/// The stack is “lazy,” in that the stack view doesn’t create items until it
/// needs to render them onscreen
struct LazyVStackExample: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(1...100, id: \.self) {
                    Text("Row \($0)")
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LazyVStackExample()
}
