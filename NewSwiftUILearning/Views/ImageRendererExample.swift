//
//  ImageRendererExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/26/24.
//

import SwiftUI

/// Shows how to use `ImageRenderer`, an object that creates images from SwiftUI views.
///
/// The SwiftUI ImageRenderer takes any view as input and outputs a UIImage on iOS, tvOS and watchOS, and an NSImage on macOS
///
/// - SeeAlso: [Using the SwiftUI 4 ImageRenderer](https://danielsaidi.com/blog/2022/06/20/using-the-swiftui-imagerenderer)
struct ImageRendererExample: View {
    @State private var snapshot: UIImage?

    var body: some View {
        VStack(spacing: 20) {
            viewToSnapshot("Original")

            if let image = snapshot {
                Image(uiImage: image)
            }

            Button(action: generateSnapshot) {
                Text("Create snapshot")
            }
            .buttonStyle(.bordered)
        }
    }
}

extension ImageRendererExample {
    func viewToSnapshot(_ title: String) -> some View {
        VStack(spacing: 5) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)

            Text(title)
        }
    }

    func generateSnapshot() {
        let renderer = ImageRenderer(content: viewToSnapshot("ImageRenderer"))

        // The default scale is, I think, 1, which will result in a blurry image.
        // Setting the sace to be the same as the device gives us a clear image.
        renderer.scale = UIScreen.main.scale

        if let image = renderer.uiImage {
            self.snapshot = image
        }
    }
}

#Preview {
    ImageRendererExample()
}
