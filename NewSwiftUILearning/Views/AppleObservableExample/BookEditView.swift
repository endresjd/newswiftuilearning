import SwiftUI

struct BookEditView: View {
    /// This is a binding to an observable type.  Used to be @ObservedObject
    @Bindable var book: Book
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            TextField("Title", text: $book.title)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    dismiss()
                }

            Button("Close") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct BookEditView_Previews: PreviewProvider {
    static var previews: some View {
        BookEditView(book: Book())
    }
}
