//
//  LazyVStackExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

struct LazyVStackExample: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(1...100, id: \.self) {
                    Text("Row \($0)")
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LazyVStackExample()
}
