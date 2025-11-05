//
//  NavigationSubtitleExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/8/25.
//

import SwiftUI

@available(iOS 26.0, *)
struct NavigationSubtitleExample: View {
    @State private var showSubtitle = true

    var body: some View {
        NavigationStack {
            if showSubtitle {
                Text("Subtitle")
                    .navigationSubtitle("NavigationSubtitle")
            } else {
                Text("No subtitle")
            }

            Button("Toggle") {
                showSubtitle.toggle()
            }
            .navigationTitle("NavigationTitle")
            .padding(.top)
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        NavigationSubtitleExample()
    } else {
        FutureFeatureView()
    }
}
