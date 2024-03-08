//
//  ShareLinkExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// Simple way to share photo information
///
/// People tap or click on a share link to present a share interface. The link typically
/// uses a system-standard appearance; you only need to supply the content to share
///
/// The link can share any content that is Transferable. Many framework types, like URL, already
/// conform to this protocol. You can also make your own types transferable.
///
/// - Important: iOS 16 minimum
struct Photo: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }


    public var image: Image
    public var caption: String
}

/// Shows how to use `ShareLink` with a custom `Transferable` struct
///
/// * By default you get a simple “Share” label with the appropriate icon, but you can also provide your own title text, or an entirely custom label
/// * SwiftUI’s ShareLink view makes it easy to share any kind of data from your app, as long as it conforms to the Transferable protocol.
/// * This shows how to share a picture of a cute dog like the late Goldie.
///
/// - Important: iOS 16 minimum
/// - Seealso: [How to let users share content using the system share sheet](https://www.hackingwithswift.com/quick-start/swiftui/how-to-let-users-share-content-using-the-system-share-sheet)
struct ShareLinkExample: View {
    let photo = Photo(image: Image("dog"), caption: "Dog")
    let photoTwo = Photo(image: Image("dog"), caption: "Dog")

    var body: some View {
        List {
            ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!)
            ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!) {
                Label("Share", systemImage: "square.and.arrow.up.trianglebadge.exclamationmark")
            }
            ShareLink("Share URL", item: URL(string: "https://developer.apple.com/xcode/swiftui/")!)
            
            photo.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .toolbar {
                    ShareLink(
                        item: photo,
                        preview: SharePreview(
                            photo.caption,
                            image: photo.image)
                    )
                }
            
            photoTwo.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .toolbar {
                    ShareLink(
                        item: photoTwo,
                        subject: Text("Cool Photo"),
                        message: Text("Check it out!"),
                        preview: SharePreview(
                            photoTwo.caption,
                            image: photoTwo.image)
                    )
                }
        }
    }
}

#Preview {
    NavigationStack {
        ShareLinkExample()
    }
}
