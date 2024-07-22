//
//  FutureFeatureView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/13/24.
//

import SwiftUI

struct FutureFeatureView: View {
    var body: some View {
        ContentUnavailableView(
            "iOS 18 only",
            systemImage: "peacesign",
            description: Text("Update your device")
        )
    }
}

#Preview {
    FutureFeatureView()
}
