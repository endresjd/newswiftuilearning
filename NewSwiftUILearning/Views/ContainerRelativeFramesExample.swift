//
//  ContainerRelativeFramesExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/15/25.
//

import SwiftUI

/// Example for container relative frames
///
/// Basically a way to size a view without having to use GeometryReader
/// and its side effects.
///
/// Some container types
///
/// * The window presenting a view on iPadOS or macOS, or the screen of a device on iOS
/// * A column of a NavigationSplitView
/// * A NavigationStack
/// * A tab of a TabView
/// * A scrollable view like ScrollView or List
///
/// - SeeAlso: [Container relative frames in SwiftUI](https://swiftwithmajid.com/2025/01/28/container-relative-frames-in-swiftui), [containerRelativeFrame(_:alignment:)](https://developer.apple.com/documentation/swiftui/view/containerrelativeframe(_:alignment:))
struct ContainerRelativeFramesExample: View {
    var body: some View {
        VStack {
            Text("Size depends on nearest container")
                .containerRelativeFrame([.horizontal], alignment: .leading)
                .background(Color.pink)

            Text("Older way")
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
                .background(Color.pink)
            
            // Kinda feels like a caurosel...
            ScrollView(.horizontal) {
                LazyHStack(spacing: 1.0) {
                    ForEach(0...2, id: \.self) { item in
                        Rectangle()
                            .fill(.purple)
                            .aspectRatio(3.0 / 2.0, contentMode: .fit)  // Vertical size
                            .containerRelativeFrame([.horizontal])      // Horizontal size
                            .overlay {
                                Text("John")
                            }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContainerRelativeFramesExample()
}
