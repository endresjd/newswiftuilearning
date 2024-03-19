//
//  ContainerRelativeShapeExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Shows how to use iOS 14's ContainerRelativeShape.
///
/// SwiftUI has a number of built-in shapes that are self-explanatory, but there’s one that stands out: ContainerRelativeShape.
/// This isn’t a fixed shape, but is instead designed to be an insettable version of whatever shape it’s placed inside, which is
/// particularly important when creating home screen widgets.
///
/// This is a  shape that is replaced by an inset version of the current container shape. If no container shape was defined,
/// is replaced by a rectangle.  Gives a nicer look.
///
/// Lets you coordinate inset curves and radii?  Most examples are around Widgets.
struct ContainerRelativeShapeExample: View {
    var body: some View {
        VStack {
            Text("Not relative")
                .bold()
                .padding(22)
                .background(.red, in: RoundedRectangle(cornerRadius: 30))
                .padding(5)
                .background(.black, in: RoundedRectangle(cornerRadius: 30))
                .padding(5)
                .background(.green, in: RoundedRectangle(cornerRadius: 30))
                .padding(5)
                .background(.yellow, in: RoundedRectangle(cornerRadius: 30))
                .padding(5)
                .background(.blue, in: RoundedRectangle(cornerRadius: 30))

             Text("Relative")
                 .bold()
                 .padding(22)
                 .background(ContainerRelativeShape().fill(Color.red))
                 .padding(5)
                 .background(ContainerRelativeShape().fill(Color.black))
                 .padding(5)
                 .background(ContainerRelativeShape().fill(Color.green))
                 .padding(5)
                 .background(ContainerRelativeShape().fill(Color.yellow))
                 .padding(5)
                 .background(ContainerRelativeShape().fill(Color.blue))
                 .background(.clear, in: RoundedRectangle(cornerRadius: 30))    // Curves
         }
         .padding()
    }
}

#Preview {
    ContainerRelativeShapeExample()
}
