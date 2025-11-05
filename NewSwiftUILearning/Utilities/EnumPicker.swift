//
//  EnumPicker.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/2/25.
//

import SwiftUI

/// Turn a String-based enum into a Picker.
///
/// The enum must be String based and CaseIterable for this to work because
/// of the Picker's use of ForEach.
///
///     enum Example: String, CaseIterable {
///         case one
///         case two
///     }
struct EnumPicker<T: RawRepresentable & CaseIterable & Hashable>: View where T.AllCases: RandomAccessCollection, T.RawValue == String {
    /// The title for the picker.
    var title: String

    /// True to sort the cases.
    var sorted = false

    /// If the text value should be capitalized.
    var capitalized = false

    /// Holds the currently selected item.
    @Binding var selection: T

    /// Returns all cases of the enum, sorted and capitalized if needed.
    private var allCases: T.AllCases {
        if sorted {
            let result =
                T.allCases.sorted { left, right -> Bool in
                    guard capitalized else {
                        return left.rawValue < right.rawValue
                    }
                    return left.rawValue.capitalized < right.rawValue.capitalized
                } as? T.AllCases

            if let result {
                return result
            }
        }

        return T.allCases
    }

    @ViewBuilder
    var body: some View {
        Picker(title, selection: $selection) {
            ForEach(allCases, id: \.self) { item in
                if capitalized {
                    Text(item.rawValue.capitalized)
                } else {
                    Text(item.rawValue)
                }
            }
        }
    }
}

/// This is solely for the Preview.
///
/// Can't be declared inside the macro, and I don't want to figure out
/// an elegant solution to it.
private enum ExampleEnum: String, CaseIterable {
    case one
    case two
    case three = "Three"
}

#Preview {
    @Previewable @State var selection = ExampleEnum.one

    EnumPicker(title: "Example", sorted: false, selection: $selection)
    EnumPicker(title: "Example", sorted: true, capitalized: true, selection: $selection)

    Form {
        EnumPicker(title: "Example", sorted: false, selection: $selection)
        EnumPicker(title: "Example", sorted: true, capitalized: true, selection: $selection)
    }
}
