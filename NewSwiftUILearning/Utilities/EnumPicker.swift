//
//  EnumPicker.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/2/25.
//

import SwiftUI

/// Turn a String-based enum into a Picker
/// 
/// The enum must be String based and CaseIterable for this to work because
/// of the Picker's use of ForEach.
/// 
///     enum Example: String, CaseIterable {
///         case one
///         case two
///     }
struct EnumPicker<T: RawRepresentable & CaseIterable & Hashable>: View where T.AllCases: RandomAccessCollection, T.RawValue == String {
    /// The title for the picker
    var title: String
    
    /// True to sort the cases
    var sorted = false
    
    /// Holds the currently selected item
    @Binding var selection: T
    
    var allCases: T.AllCases {
        if sorted, let result = T.allCases.sorted(by: { $0.rawValue < $1.rawValue }) as? T.AllCases {
            return result
        }
        
        return T.allCases
    }
    
    var body: some View {
        Picker(title, selection: $selection) {
            ForEach(allCases, id: \.self) { item in
                Text(item.rawValue)
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
    case three
}

#Preview {
    @Previewable @State var selection = ExampleEnum.one

    EnumPicker(title: "Example", sorted: false, selection: $selection)
    EnumPicker(title: "Example", sorted: true, selection: $selection)
    
    Form {
        EnumPicker(title: "Example", sorted: false, selection: $selection)
        EnumPicker(title: "Example", sorted: true, selection: $selection)
    }
}
