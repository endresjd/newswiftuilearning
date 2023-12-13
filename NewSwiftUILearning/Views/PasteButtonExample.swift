//
//  PasteButtonExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

struct PasteButtonExample: View {
    @State private var pastedText: String = ""

    var contents: String {
        pastedText.isEmpty ? " " : pastedText
    }
    
    var body: some View {
        VStack {
            HStack {
                PasteButton(payloadType: String.self) { strings in
                    pastedText = strings[0]
                }

                PasteButton(payloadType: String.self) { strings in
                    pastedText = strings[0]
                }
                .labelStyle(.iconOnly)

                PasteButton(payloadType: String.self) { strings in
                    pastedText = strings[0]
                }
                .labelStyle(.iconOnly)
                .tint(.black)
            }
            Divider()
            Text(contents)
            Divider()
            Spacer()
        }
    }
}

#Preview {
    PasteButtonExample()
}
