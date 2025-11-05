//
//  HeroAnimationView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/13/24.
//

import SwiftUI

/// Hero Animations.
///
/// It enables us to create smooth transitions between views using the same identifier and namespace
/// while navigating from one view to another inside NavigationStack.
struct HeroAnimationView: View {
    /// Grouping for animations within a view?
    @Namespace private var hero

    var body: some View {
        if #available(iOS 18, *) {
            NavigationStack {
                NavigationLink {
                    Text("Detail")
                        .navigationTransition(.zoom(sourceID: "myId", in: hero))
                        .navigationTitle("Here")
                } label: {
                    Label("Tap or Click here", systemImage: "laser.burst")
                        .foregroundStyle(Color.red)
                }
                .matchedTransitionSource(id: "myId", in: hero)
            }
        } else {
            FutureFeatureView()
        }
    }
}

#Preview {
    HeroAnimationView()
}
