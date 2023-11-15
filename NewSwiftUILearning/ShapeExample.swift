//
//  ShapeExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

// The key to understanding the difference between Path and Shape is
// reusability: paths are designed to do one specific thing, whereas 
// shapes have the flexibility of drawing space and can also accept
// parameters to let us customize them further.
//
// https://www.hackingwithswift.com/books/ios-swiftui/paths-vs-shapes-in-swiftui
struct ShapeExample: View {
    var body: some View {
        ScrollView {
            Triangle()
                .fill(.red)
                .frame(width: 300, height: 300)

            Triangle()
                .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 300, height: 300)
        }
    }
}

#Preview {
    ShapeExample()
}
