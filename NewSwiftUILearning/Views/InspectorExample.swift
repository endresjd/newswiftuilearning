//
//  InspectorExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 3/21/25.
//

import SwiftUI

/// Compares Sheets and Inspectors.
///
/// Apply the inspector modifier to declare an inspector with a context-dependent presentation.
/// For example, an inspector can present as a trailing column in a horizontally regular size class,
/// but adapt to a sheet in a horizontally compact size class
///
/// Inspector is a context-dependent presentation. It appears as a sheet in a compact environment,
/// whereas it displays a trailing column in your view hierarchy in a regular environment. The SwiftUI
/// API for inspectors looks very similar to the sheet API. Let’s take a look at the simple example.
///
/// - SeeAlso: [inspector](https://developer.apple.com/documentation/swiftui/view/inspector%28ispresented%3Acontent%3A%29) and
/// [InspectorCommands](https://developer.apple.com/documentation/swiftui/inspectorcommands) and
/// [Inspectors in SwiftUI: Discover the details](https://wwdcnotes.com/documentation/wwdcnotes/wwdc23-10161-inspectors-in-swiftui-discover-the-details/)
struct InspectorExample: View {
    @State private var simpleInspector = false
    @State private var presented = false
    @State private var sheet = false
    let intrigued = "This is a string"

    var body: some View {
        VStack(spacing: 50.0) {
            Text("Inspectors vs. Sheets")

            Button("Simple Inspector") {
                simpleInspector.toggle()
            }

            Button("Inspector") {
                presented.toggle()
            }

            Button("Sheet") {
                sheet.toggle()
            }
        }
        .inspector(isPresented: $simpleInspector) {
            // Supports some basic navigation modifiers
            Form {
                LabeledContent("size", value: intrigued.count.formatted())
            }
            .navigationTitle("Inspector")
        }
        .inspector(isPresented: $presented) {
            // Requires more work and different placement for some of the
            // navigation modifiers.  Slightly moving the sheet will
            // cause the correct ones to show but then crash soon after.
            // Weird.  Best not to use NavigationStack?
            //            NavigationStack {
            Form {
                LabeledContent("size", value: intrigued.count.formatted())

                // These require an explicit NavigationStack
                NavigationLink("Mint", value: Color.mint)
                NavigationLink("Pink", value: Color.pink)

                // These don't.  There seems to be some kind of navigation
                // setup here, but it's not setup for `.navigationDestination`
                // fully
                NavigationLink("Teal") { InspectorColorDetail(color: .teal) }

                NavigationLink {
                    InspectorColorDetail(color: .red)
                } label: {
                    Label("Work Folder", systemImage: "folder")
                }
            }
            .inspectorColumnWidth(min: 100, ideal: 150, max: 200) // Optional
            .navigationTitle("Inspector") // No effect with NavigationStack
            .navigationDestination(for: Color.self) { color in
                InspectorColorDetail(color: color)
            }
            .toolbar {
                Spacer()

                Button {
                    presented.toggle()
                } label: {
                    Label("Toggle Inspector", systemImage: "info.circle")
                }
            }
            //            }
            //            .navigationTitle("Navigation Stack")
        }
        .sheet(isPresented: $sheet) {
            // The navigation modifiers here do nothing without a
            // NavigationStack.
            NavigationStack {
                Form {
                    LabeledContent("size", value: intrigued.count.formatted())

                    NavigationLink {
                        InspectorColorDetail(color: .mint)
                    } label: {
                        Label("Work Folder", systemImage: "folder")
                    }
                }
                .navigationTitle("Inspector")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: Color.self) { color in
                    Text(String(describing: color))
                }
            }
            .navigationTitle("Navigation Stack") // No effect with NavigationStack
        }
    }
}

struct InspectorColorDetail: View {
    var color: Color

    var body: some View {
        color
            .navigationTitle(color.description)
    }
}

#Preview {
    InspectorExample()
}
