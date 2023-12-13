//
//  CanvasExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Use a canvas to draw rich and dynamic 2D graphics inside a SwiftUI view
///
/// See [Canvas](https://developer.apple.com/documentation/swiftui/canvas)
struct CanvasExample: View {
    var body: some View {
        Canvas { context, size in
            context.stroke(
                Path(ellipseIn: CGRect(origin: .zero, size: size)),
                with: .color(.green),
                lineWidth: 4)
        }
        .frame(width: 300, height: 200)
        .border(Color.blue)
    }
}

#Preview {
    CanvasExample()
}
