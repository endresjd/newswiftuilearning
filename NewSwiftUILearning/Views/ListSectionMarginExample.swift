//
//  ListSectionMarginExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/8/25.
//

import SwiftUI

@available(iOS 26.0, *)
struct ListSectionMarginExample: View {
    var body: some View {
        List {
            Section(header: Text("Important tasks")) {
                Text("Row")
                Text("Row")
                Text("Row")
            }
            .headerProminence(.increased)
            .listSectionMargins(.bottom, 150)

            Section(header: Text("Other tasks")) {
                Text("Row")
                Text("Row")
                Text("Row")
            }
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        ListSectionMarginExample()
    } else {
        FutureFeatureView()
    }
}
