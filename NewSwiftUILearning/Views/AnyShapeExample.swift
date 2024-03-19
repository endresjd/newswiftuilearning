//
//  AnyShapeExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Shows how to dynamically switch between shape types in iOS 16
///
/// A green rectangle view that will be clipped based on its property
///
/// - Requires: iOS 16
private struct MyClippedView: View {
    /// True if the clip shape should be a cirlce, false if it should be a capsule
    var isCircular: Bool

    var body: some View {
        Rectangle()
            .fill(Color.green)
            .frame(width: 300, height: 200)
            .clipShape(isCircular ? AnyShape(Circle()) : AnyShape(Capsule()))
    }
}

/// Shows 2 versions of the clipped view using AnyShape.
///
/// - Requires: iOS 16
struct AnyShapeExample: View {
    var body: some View {
        MyClippedView(isCircular: false)
        MyClippedView(isCircular: true)
    }
}

#Preview {
    AnyShapeExample()
}
