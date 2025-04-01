//
//  ScrollViewVisibility.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 3/31/25.
//

import SwiftUI

/// ScrollView visibility extensions to SwiftUI
///
/// - SeeAlso: [Mastering ScrollView in SwiftUI. Scroll Visibility](https://swiftwithmajid.com/2024/07/16/mastering-scrollview-in-swiftui-scroll-visibility)
struct ScrollViewVisibility: View {
    @State private var visible: [Int] = []
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1..<100, id: \.self) { item in
                    Text(verbatim: item.formatted())
                }
            }
            .scrollTargetLayout()
        }
        .onScrollTargetVisibilityChange(idType: Int.self) { identifiers in
            visible = identifiers
        }
        .onChange(of: visible) {
            print(visible)
        }
    }
}

#Preview {
    ScrollViewVisibility()
}
