//
//  CanvasExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Use a canvas to immediately draw rich and dynamic 2D graphics inside a SwiftUI view in iOS 15
///
/// Use a canvas to draw rich and dynamic 2D graphics inside a SwiftUI view. The canvas passes a GraphicsContext 
/// to the closure that you use to perform immediate mode drawing operations. The canvas also passes a CGSize
/// value that you can use to customize what you draw. For example, you can use the context’s stroke(_:with:lineWidth:)
/// command to draw a Path instance
///
/// A canvas doesn’t offer interactivity or accessibility for individual elements, including for views that you pass in as
/// symbols. However, it might provide better performance for a complex drawing that involves dynamic data. Use a
/// canvas to improve performance for a drawing that doesn’t primarily involve text or require interactive elements
///
/// - SeeAlso: [Canvas](https://developer.apple.com/documentation/swiftui/canvas)
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
