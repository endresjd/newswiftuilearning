//
//  GeometryReaderExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}

struct OuterView: View {
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

//    var body: some View {
//        VStack(alignment: .center) {
//            Text("Hello, World!")
//                .background(.blue)
//
//            // GeometryReader has an interesting side effect that might catch
//            // you out at first: the view that gets returned has a flexible
//            // preferred size, which means it will expand to take up more space
//            // as needed
//            GeometryReader { geo in
//                Text("Hello, World!")
//                    .frame(width: geo.size.width * 0.9)
//                    .background(.red)
//            }
//
//            Text("More text")
//                .background(.blue)
//        }
//    }
}

#Preview {
    GeometryReaderExample()
}
