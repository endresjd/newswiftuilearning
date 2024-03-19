//
//  PathExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// Draws a series of triangles using iOS 13's `Path`
///
/// A path is a representation of a 2D shape.  In this case a series of lines
/// converging to a starting point to make triangles.
struct PathExample: View {
    var body: some View {
        ScrollView {
            // When our triangle code runs, you’ll see a large black
            // triangle. Where you see it relative to your screen
            // depends on what simulator you are using, which is part of
            // the problem of these raw paths: we need to use exact
            // coordinates, so if you want to use a path by itself you
            // either need to accept that sizing across all devices or use
            // something like GeometryReader to scale them relative to
            // their container
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
            }
            
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
            }
            .fill(.blue)

            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
                path.closeSubpath()
            }
            .stroke(.yellow, lineWidth: 10)
            
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
            }
            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        }
    }
}

#Preview {
    PathExample()
}
