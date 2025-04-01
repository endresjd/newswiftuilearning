//
//  PlaygoundView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 3/31/25.
//

import SwiftUI

struct PlaygoundView: View {
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
    PlaygoundView()
}
