//
//  ListExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Very minimal example of iOS 13's `List` with an `EditButton`
///
/// Almost the simplest example you can get.
/// 
/// - ToDo: Expand this out to include the multidimensional list example from help.
struct ListExample: View {
    struct Ocean: Identifiable, Hashable {
        let name: String
        let id = UUID()
    }
    
    private var oceans = [
        Ocean(name: "Pacific"),
        Ocean(name: "Atlantic"),
        Ocean(name: "Indian"),
        Ocean(name: "Southern"),
        Ocean(name: "Arctic")
    ]
    
    @State private var multiSelection = Set<UUID>()

    var body: some View {
        NavigationView {
            List(oceans, selection: $multiSelection) {
                Text($0.name)
            }
            .navigationTitle("Oceans")
            .toolbar {
                EditButton()
            }
        }
        
        Text("\(multiSelection.count) selections")
    }
}

#Preview {
    ListExample()
}
