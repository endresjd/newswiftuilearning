//
//  ZoomNavigationTransitionExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/11/24.
//

import SwiftUI

struct ZoomNavigationTransitionExample: View {
    var body: some View {
        PartyView(party: Party(name: "name"))
    }
}

struct PartyView: View {
    var party: Party
    @Namespace() var namespace
    
    var body: some View {
        if #available(iOS 18, *) {
            NavigationLink {
                PartyDetailView(party: party)
                    .navigationTransition(
                        .zoom(
                            sourceID: party.id,
                            in: namespace
                        )
                    )
            } label: {
                Text("Party!")
            }
            .matchedTransitionSource(id: party.id, in: namespace)
        } else {
            ContentUnavailableView(
                "iOS 18 only",
                systemImage: "peacesign",
                description: Text("Will need a device with the new OS")
            )
        }
    }
}

struct PartyDetailView: View {
    var party: Party
    
    var body: some View {
        Text("PartyDetailView")
    }
}

#Preview {
    NavigationStack {
        ZoomNavigationTransitionExample()
    }
}
