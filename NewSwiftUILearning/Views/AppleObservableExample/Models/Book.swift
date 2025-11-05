import SwiftUI

@Observable final class Book: Identifiable {
    var title = "Sample Book Title"

    let id = UUID() // A unique identifier that never changes.
}
