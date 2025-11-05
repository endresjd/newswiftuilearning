//
//  LabelExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Various examples of iOS 14's `Label` including defining a `LabelStyle`.
///
/// One of the most common and recognizable user interface components is the combination
/// of an icon and a label. This idiom appears across many kinds of apps and shows up in
/// collections, lists, menus of action items, and disclosable lists, just to name a few.
///
/// You create a label, in its simplest form, by providing a title and the name of an image, such as an icon from the SF Symbols collection
///
/// - ToDo: Add a view modifier to wrap `RedBorderedLabelStyle()`
struct LabelExample: View {
    var body: some View {
        List {
            Label("Lightning normal", systemImage: "bolt.fill")

            Label("Lightning title only", systemImage: "bolt.fill")
                .labelStyle(.titleOnly)

            Label("Lightning icon only", systemImage: "bolt.fill")
                .labelStyle(.iconOnly)

            // To force both in cases where the containing view
            // might prefer a different combination
            Label("Lightning force title and icon", systemImage: "bolt.fill")
                .labelStyle(.titleAndIcon)

            Label("Lightning red bordered style", systemImage: "bolt.fill")
                .labelStyle(RedBorderedLabelStyle())

            Label {
                Text("First Last")
                    .font(.body)
                    .foregroundColor(.primary)
                Text("User")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            } icon: {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 44, height: 44, alignment: .center)
                    .overlay(Text("FL"))
            }
        }
    }
}

/// A Customized label style.
private struct RedBorderedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .border(Color.red)
    }
}

#Preview {
    LabelExample()
}
