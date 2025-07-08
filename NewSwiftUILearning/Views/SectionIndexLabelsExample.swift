//
//  SectionIndexLabelsExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/8/25.
//

import SwiftUI

@available(iOS 26.0, *)
struct SectionIndexLabelsExample: View {
    let letters = ["A", "B", "C", "D", "E", "F", "G"]

    var body: some View {
        List(letters, id: \.self) { letter in
            Section(letter) {
                ForEach(0..<10) { number in
                    Text("Row \(number)")
                }
            }
            .sectionIndexLabel(letter)  // Content control on the right
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        SectionIndexLabelsExample()
    } else {
        FutureFeatureView()
    }
}
