//
//  PickerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    
    var id: Self {
        self
    }
}

struct PickerExample: View {
    @State private var selectedFlavor: Flavor = .chocolate

    var body: some View {
        List {
            Picker("Flavor", selection: $selectedFlavor) {
                ForEach(Flavor.allCases) { value in
                    Text(value.rawValue.capitalized)
                        .tag(value)
                }
            }
        }
        
        Text("You selected: \(selectedFlavor.rawValue)")
    }
}

#Preview {
    PickerExample()
}
