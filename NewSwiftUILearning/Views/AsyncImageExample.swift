//
//  AsyncImageExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Direct use of AsyncImage in iOS 15
///
/// 1. First just blindly shows John Lennon
/// 2. Second shows how to handle different image states ending in an error
struct AsyncImageExample: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/John_Lennon_1969_%28cropped%29.jpg/440px-John_Lennon_1969_%28cropped%29.jpg"))
        
        AsyncImage(url: URL(string: "https://example.com/icon.png")) { phase in
            if let image = phase.image {
                image // Displays the loaded image.
            } else if phase.error != nil {
                Color.red // Indicates an error.
            } else {
                Color.blue // Acts as a placeholder.
            }
        }

    }
}

#Preview {
    AsyncImageExample()
}
