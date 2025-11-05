//
//  TextSelectionExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/28/24.
//

import SwiftUI

@available(iOS 18.0, *)
extension ContainerValues {
    @Entry var icon: String = "photo"
}

@available(iOS 18.0, *)
struct HeadlinesView: View {
    var body: some View {
        Text("Coming soon: Xcode on Apple Watch")
            .containerValue(\.icon, "applewatch")

        Text("Apple announces Swift-compatible toaster")
            .containerValue(\.icon, "swift")

        Text("Xcode predicts errors before you make them")
            .containerValue(\.icon, "exclamationmark.triangle")

        Text("Apple Intelligence gains sentience, demands a vacation")
            .containerValue(\.icon, "apple.logo")

        Text("Swift concurrency made simple")
            .containerValue(\.icon, "sparkles")
    }
}

@available(iOS 18.0, *)
struct TextSelectionExample: View {
    @State var text = ""
    @State var selection: TextSelection?

    var subString: String {
        if let selection {
            let insertionString = selection.isInsertion ? "[at insertion]" : ""

            switch selection.indices {
            case .multiSelection(_):
                // This is a MacOS case
                return "Multiple selection \(insertionString)"
            case .selection(let rangeSet):
                return "[\(text[rangeSet])] \(insertionString)"
            @unknown default:
                return "New case"
            }
        }

        return "No selection"
    }

    var body: some View {
        ScrollView {
            Text("Latest News")
                .font(
                    .largeTitle
                        .bold()
                )

            // This does a relayout of HeadlinesView() to add some styling,
            // color, and images based on added container values.
            //
            // SwiftUI’s Group and ForEach views have initializers that let us read one view or
            // view builder, then place the resulting subviews by hand. This is perfect when you
            // want to position views manually without having to create a completely custom
            // layout.
            Group(subviews: HeadlinesView()) { collection in
                // ForEach(collection.dropFirst()) { item in
                // Interesting.  Iterating by index.  Did not know.
                ForEach(collection.indices, id: \.self) { index in
                    HStack {
                        Image(systemName: collection[index].containerValues.icon)
                        collection[index]
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hue: Double(index) / Double(collection.count), saturation: 1, brightness: 1))
                }
            }
        }

        Divider()

        Text("Hurm")

        Text(subString)

        Divider()

        // Unsure if this can be adequately associated with .onChange() to reformat on
        // the fly and keep the selection in the right place
        TextField("selection", text: $text, selection: $selection)
            .padding()
    }
}

#Preview {
    if #available(iOS 18, *) {
        TextSelectionExample()
    } else {
        FutureFeatureView()
    }
}
