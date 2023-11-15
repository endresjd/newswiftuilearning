//
//  LabelExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// A Customized label style
struct RedBorderedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .border(Color.red)
    }
}

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

#Preview {
    LabelExample()
}
