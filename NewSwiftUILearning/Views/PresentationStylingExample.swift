//
//  PresentationStylingExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/11/24.
//

import SwiftUI

struct PresentationStylingExample: View {
    @State var showAddSheet = true
    var parties: [Party] = []

    var body: some View {
        if #available(iOS 18, *) {
            PartiesGridView(showAddSheet: $showAddSheet, parties: parties)
                .sheet(isPresented: $showAddSheet) {
                    AddPartyView()
                        .presentationSizing(.form)
                }
        } else {
            FutureFeatureView()
        }
    }
}

struct PartiesGridView: View {
    @Binding var showAddSheet: Bool
    var parties: [Party]

    var body: some View {
        Text("PartiesGridView")
    }
}

struct AddPartyView: View {
    var body: some View {
        Text("AddPartyView")
            .font(.largeTitle)
            .padding(.bottom)

        Text("Using **presentationSizing(.form)**")
        Text("You are seeing the sheet.")
        Text("These let you present perfenctly styled sheets for each case.")
            .padding(.top)
    }
}

#Preview {
    if #available(iOS 18, *) {
        PresentationStylingExample()
    } else {
        FutureFeatureView()
    }
}
