//
//  MeshGradientExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/11/24.
//

import SwiftUI

struct MeshGradientExample: View {
    var body: some View {
        if #available(iOS 18, *) {
            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    .init(0, 0), .init(0.5, 0), .init(1, 0),
                    .init(0, 0.5), .init(0.3, 0.5), .init(1, 0.5),
                    .init(0, 1), .init(0.5, 1), .init(1, 1),
                ],
                colors: [
                    .red, .purple, .indigo,
                    .orange, .cyan, .blue,
                    .yellow, .green, .mint,
                ]
            )
            .ignoresSafeArea()
        } else {
            FutureFeatureView()
        }
    }
}

#Preview {
    MeshGradientExample()
        .statusBarHidden()
}
