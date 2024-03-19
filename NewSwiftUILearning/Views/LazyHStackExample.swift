//
//  LazyHStackExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Horizontal scrolling row of words using iOS 14's LazyHStack
///
/// A container view that arranges its child views in a stack that grows
/// horizontally, creating items only as needed
/// The stack is “lazy,” in that the stack view doesn’t create items until it
/// needs to render them onscreen
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
