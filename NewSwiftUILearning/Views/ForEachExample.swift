//
//  ForEachExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Shows a simple use of iOS 13's ForEach structure
///
/// ForEach is a structure that computes views on demand from an underlying collection of identified data.  The
/// data given to the structure must be identifiable in some way.  This way conforms the underlying struct
/// to `Identifiable`, but the id can also be passed to the `ForEach` struct's initializer.
///
/// - Remark: This example is from Apple
struct ForEachExample: View {
    private struct NamedFont: Identifiable {
        let name: String
        let font: Font
        var id: String { name }
    }


    private let namedFonts: [NamedFont] = [
        NamedFont(name: "Large Title", font: .largeTitle),
        NamedFont(name: "Title", font: .title),
        NamedFont(name: "Headline", font: .headline),
        NamedFont(name: "Body", font: .body),
        NamedFont(name: "Caption", font: .caption)
    ]


    var body: some View {
        // Use ForEach to provide views based on a RandomAccessCollection of
        // some data type. Either the collection’s elements must conform to
        // Identifiable or you need to provide an id parameter to the ForEach
        // initializer.
        ForEach(namedFonts) { namedFont in
            Text(namedFont.name)
                .font(namedFont.font)
        }
    }
}

#Preview {
    ForEachExample()
}
