//
//  DragAndDropExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/9/25.
//

import UniformTypeIdentifiers
import SwiftUI

/// Shows how to do drag and drop
///
/// - SeeAlso:
/// [Drag and Drop in SwiftUI](https://medium.com/@jpmtech/drag-and-drop-in-swiftui-2ff65c263d2e)
/// and
/// [Making a view into a drag source](https://developer.apple.com/documentation/swiftui/making-a-view-into-a-drag-source)
///
struct DragAndDropExample: View {
    private let name = "John Endres"
    
    /// For the Medium example for hilighting the destination
    @State private var rectangleIsTargeted = false
    
    /// Droppable data
    ///
    /// Shows how to specifiy and use model data for dragging.
    @State private var profiles = [
        Profile(name: "Jenny Jenny", phoneNumber: "(216) 867-5309"),
        Profile(name: "Joe Friday", phoneNumber: "(555) 555-1212")
    ]

    var body: some View {
        VStack {
            List {
                ForEach(profiles) { profile in
                    Text(profile.name)
                        .draggable(profile)
                }
                .onMove { indices, newOffset in
                    // Update the items array based on source and destination indices.
                    // This is optional
                    profiles.move(fromOffsets: indices, toOffset: newOffset)
                }
            }

            Text(name)
            // Customize the lift preview that the system shows during the transition
                .contentShape(.dragPreview, RoundedRectangle(cornerRadius: 7))
                .draggable(name) {
                    // Custom preview that is optional
                    ZStack {
                        // Note: this is an Apple example.  The text
                        // doesn't seem to show?
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 300, height: 300)
                            .foregroundStyle(.yellow.gradient)
                        Text("Drop \(name)")
                            .font(.title)
                            .foregroundStyle(.red)
                    }
                }
            
            Rectangle()
            // we are lightening the rectange if someone is hovering over it with the expected payload
            // to help users know that this is a target they can drop something onto
                .foregroundStyle(.secondary.opacity(rectangleIsTargeted ? 0.3 : 1))
                .dropDestination(for: Profile.self) { profile, location in
                    // Apple docs are incomplete here.  Bad example.
                    print(profile)
                    print(location)
                    
                    return true
                } isTargeted: { value in
                    // this lets our state variable know that our drop destination has been targeted
                    // meaning that it could be about to recieve a transferrable object
                    rectangleIsTargeted = value
                }
                .dropDestination(for: String.self) { items, location in
                    guard let firstItem = items.first else {
                        // if we don't have anything in our first item,
                        // then something must have gone wrong and we want to let the system know
                        // so we return false
                        return false
                    }
                    
                    print("firstItem:", firstItem)
                    
                    //if the drop was successful, we will want to return true
                    return true
                } isTargeted: { isTargeted in
                    // this lets our state variable know that our drop destination has been targeted
                    // meaning that it could be about to recieve a transferrable object
                    rectangleIsTargeted = isTargeted
                }
        }

        
//        VStack {
//            Text("Hello, world!")
//                .draggable("hello world")
//            
//            Rectangle()
//                // we are lightening the rectange if someone is hovering over it with the expected payload
//                // to help users know that this is a target they can drop something onto
//                .foregroundStyle(.secondary.opacity(rectangleIsTargeted ? 0.3 : 1))
//                .dropDestination(for: String.self) { items, location in
//                    guard let firstItem = items.first else {
//                        // if we don't have anything in our first item,
//                        // then something must have gone wrong and we want to let the system know
//                        // so we return false
//                        return false
//                    }
//                    
//                    print("firstItem:", firstItem)
//                    
//                    //if the drop was successful, we will want to return true
//                    return true
//                } isTargeted: { isTargeted in
//                    // this lets our state variable know that our drop destination has been targeted
//                    // meaning that it could be about to recieve a transferrable object
//                    rectangleIsTargeted = isTargeted
//                }
//        
//        }
//        .padding()
    }
}

/// Transferable item for drag-and-drop operations
///
/// To support drag operations of model objects, conform a model to the Transferable protocol to
/// create a transferable item, and implement the transferRepresentation static property. Types like
/// String, Data, URL, and Image already conform to Transferable, making them easy to use in drag-and-drop operations.
struct Profile: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var phoneNumber: String
}

extension Profile: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .profile)
        ProxyRepresentation(exporting: \.name)
    }
}

extension UTType {
    static let profile = UTType(exportedAs: "com.macplugins.NewSwiftUILearning.profile")
}

#Preview {
    DragAndDropExample()
}
