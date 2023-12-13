//
//  TextEditorExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/15/23.
//

import SwiftUI

struct TextEditorExample: View {
    @State private var fullText: String = "This is some editable text..."

    var body: some View {
        TextEditor(text: $fullText)
//            .foregroundColor(Color.blue)
//            .font(.custom("HelveticaNeue", size: 13))
//            .lineSpacing(5)
    }
}

#Preview {
    TextEditorExample()
}
