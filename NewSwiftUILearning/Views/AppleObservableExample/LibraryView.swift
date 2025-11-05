import SwiftUI

struct LibraryView: View {
    @Environment(Library.self) private var library

    var body: some View {
        List(library.books) { book in
            BookView(book: book)
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environment(Library())
    }
}
