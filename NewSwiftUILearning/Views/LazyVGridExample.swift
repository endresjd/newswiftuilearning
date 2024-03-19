//
//  LazyVGridExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Horizontal scrolling row of emojis and numbers using iOS 14's LazyHGrid
///
/// A container view that arranges its child views in a grid that grows
/// vertically, creating items only as needed
struct LazyVGridExample: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
         ScrollView {
             LazyVGrid(columns: columns) {
                 ForEach(0x1f600...0x1f679, id: \.self) { value in
                     Text(String(format: "%x", value))
                     Text(emoji(value))
                         .font(.largeTitle)
                 }
             }
         }
    }


    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

#Preview {
    LazyVGridExample()
}
