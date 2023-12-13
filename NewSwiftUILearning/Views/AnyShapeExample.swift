//
//  AnyShapeExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

struct MyClippedView: View {
    var isCircular: Bool

    var body: some View {
        Rectangle()
            .fill(Color.green)
            .frame(width: 300, height: 200)
            .clipShape(isCircular ? AnyShape(Circle()) : AnyShape(Capsule()))
    }
}

struct AnyShapeExample: View {
    var body: some View {
        MyClippedView(isCircular: false)
        MyClippedView(isCircular: true)
    }
}

#Preview {
    AnyShapeExample()
}
