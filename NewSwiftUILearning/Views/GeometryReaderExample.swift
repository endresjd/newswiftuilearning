//
//  GeometryReaderExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Uses iOS 13's GeometryReader to determine and print taps on some text as I understand it.
///
///     1. Positioning the Text with `.position` will center it but will force it to use all space
///     2. Not positioning it will keep it at its normal size, but not center it.
///
/// Keep in mine that this view messes up the view layout.
///
/// - Experiment: Uncomment `.position` to center the view and see what happens.
/// - Experiment: See if position can be controlled by a toggle in real time
/// - SeeAlso: [onTapGesture](https://developer.apple.com/documentation/swiftui/view/ontapgesture(count:coordinatespace:perform:)-21n4i)
///             for a less intrusive way to do this on iOS 17.
/// - SeeAlso: [SwiftUI GeometryReader does not layout custom subviews in center](https://stackoverflow.com/questions/60373719/swiftui-geometryreader-does-not-layout-custom-subviews-in-center)
private struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            
            GeometryReader { geometry in
                Text("Center")
                    // .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(geometry.frame(in: .global).midX) x \(geometry.frame(in: .global).midY)")
                        print("Custom center: \(geometry.frame(in: .named("Custom")).midX) x \(geometry.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geometry.frame(in: .local).midX) x \(geometry.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            
            Text("Right")
        }
    }
}

private struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            
            InnerView()
                .background(.green)
            
            Text("Bottom")
        }
    }
}

struct GeometryReaderExample: View {
    var body: some View {
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")    // Used in GeometryReader to get location relative to this view
    }
}

#Preview {
    GeometryReaderExample()
}
