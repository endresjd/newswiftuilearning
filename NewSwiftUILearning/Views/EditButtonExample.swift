//
//  EditButtonExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Shows how to add iOS 13's edit button to the toolbar.
///
/// This sets up a NavigationView with an edit button in its toolbar
/// that allows moving and deletion of items.
struct EditButtonExample: View {
    @State private var fruits = [
        "Apple",
        "Banana",
        "Papaya",
        "Mango"
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
                .onDelete { fruits.remove(atOffsets: $0) }
                .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
            }
            .navigationTitle("Fruits")
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    EditButtonExample()
}
