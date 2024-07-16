//
//  CustomeContainerView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/11/24.
//

import SwiftUI

struct CustomeContainerView: View {
    var body: some View {
        if #available(iOS 18, *) {
            DisplayBoard() {
                // These are called declared subviews
                Section("First") {
                    Text("One")
                    Text("Two")
                        .crossedOff(true)
                    Text("Three")
                }

                Section("Second") {
                    Text("One")
                    Text("Two")
                        .crossedOff(true)
                    Text("Three")
                }
            }
        } else {
            FutureFeatureView()
        }
    }
}

private struct Song: Identifiable {
    let id = UUID()
    let name: String
}

@available(iOS 18.0, *)
struct DisplayBoard<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        List {
            Section("ForEach(subviewOf:)") {
                // These is a declared subview.  Iterates over the subviews.
                ForEach(subviewOf: content) { subview in
                    let values = subview.containerValues
                    
                    // What's here are called the resolved subviews
                    subview
                        .strikethrough(values.crossedOff)
                }
            }
            
            Section("Group(subviewsOf:)") {
                // Like the previous ForEach(subviewOf:) API, this view accepts a view as
                // input and resolves its subviews.  But instead of iterating over them one
                // at a time, the Group(subviewsOf:) API passes back a collection, of all
                // of the resolved subviews.
                Group(subviewsOf: content) { subviews in
                    Text("Count: **\(subviews.count)**")
                    
                    ForEach(subviews) { subview in
                        let values = subview.containerValues
                        
                        subview
                            .strikethrough(values.crossedOff)
                    }
                }
            }
            
            Section("ForEach(sectionOf:).") {
                ForEach(sectionOf: content) { section in
                    Group {
                        if section.header.isEmpty {
                            Text("No section header")
                        } else {
                            section
                                .header
                        }
                    }
                    .bold()
                    
                    // This is a SubviewsCollection
                    ForEach(subviewOf: section.content) { subview in
                        // Supposed to get the container value attached to a subview
                        // but is not working in this example
                        let values = subview.containerValues
                        
                        // What's here are called the resolved subviews
                        subview
                            .strikethrough(values.crossedOff)
                    }
                }
            }
        }
    }
}

@available(iOS 18.0, *)
extension ContainerValues {
    // The Entry macro is a new API, that provides a convenient syntax for
    // adding new values to SwiftUI keyed storage types, including environment
    // values, focus values, and more.
    @Entry var crossedOff = false
}

@available(iOS 18.0, *)
extension View {
    func crossedOff(_ isRejected: Bool) -> some View {
        containerValue(\.crossedOff, isRejected)
    }
}

#Preview {
    CustomeContainerView()
}

@available(iOS 18.0, *)
#Preview("DisplayBoard") {
    let songs = [
        Song(name: "Alpha"),
        Song(name: "Beta"),
        Song(name: "Gamma")
    ]
    
    DisplayBoard() {
        Text("Blah")
            .crossedOff(true)
        
        Section("Static") {
            // These are called declared subviews.
            // The defined a recipe for producing the resolved subviews.
            Text("One")
            Text("Two")
                .crossedOff(true)
            Text("Three")
        }
        
        Section("Dynamic") {
            ForEach(songs) { song in
                Text(song.name)
            }
        }
    }
}
