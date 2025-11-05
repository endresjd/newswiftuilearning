//
//  PickerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// Shows a flavor picker using iOS 13's `Picker` control.
///
/// You create a picker by providing a selection binding, a label, and the content for the picker to
/// display. Set the selection parameter to a bound property that provides the value to display as
/// the current selection. Set the label to a view that visually describes the purpose of selecting
/// content in the picker, and then provide the content for the picker to display.
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

private enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry

    var id: Self {
        self
    }
}

#Preview {
    PickerExample()
}
