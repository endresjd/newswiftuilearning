//
//  OutlineGroupExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

private struct FileItem: Hashable, Identifiable, CustomStringConvertible {
    var id: Self { self }
    var name: String
    var children: [FileItem]? = nil
    var description: String {
        switch children {
        case nil:
            return "📄 \(name)"
        case .some(let children):
            return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
        }
    }
}

// To be Sendable, the value must be Sendable
private struct Tree<Value>: Hashable where Value: Hashable, Value: Sendable {
    let value: Value
    var children: [Tree]? = nil
}

/// Shows iOS 14's `OutlineGroup` to show a simulated file and tree browser.
///
/// Use an outline group when you need a view that can represent a hierarchy of data
/// by using disclosure views. This allows the user to navigate the tree structure
/// by using the disclosure views to expand and collapse branches.
///
/// - Experiment: See if this came be made to look better with indentation or something
struct OutlineGroupExample: View {
    fileprivate let data = FileItem(
        name: "users",
        children: [
            FileItem(
                name: "user1234",
                children: [
                    FileItem(
                        name: "Photos",
                        children: [
                            FileItem(name: "photo001.jpg"),
                            FileItem(name: "photo002.jpg"),
                        ]),
                    FileItem(name: "Movies", children: [FileItem(name: "movie001.mp4")]),
                    FileItem(name: "Documents", children: []),
                ]),
            FileItem(
                name: "newuser",
                children: [
                    FileItem(name: "Documents", children: [])
                ]),
        ])
    fileprivate let categories: [Tree<String>] = [
        Tree(
            value: "Clothing",
            children: [
                Tree(value: "Hoodies"),
                Tree(value: "Jackets"),
                Tree(value: "Joggers"),
                Tree(value: "Jumpers"),
                Tree(
                    value: "Jeans",
                    children: [
                        Tree(value: "Regular"),
                        Tree(value: "Slim"),
                    ]
                ),
            ]
        ),
        Tree(
            value: "Shoes",
            children: [
                Tree(value: "Boots"),
                Tree(value: "Sliders"),
                Tree(value: "Sandals"),
                Tree(value: "Trainers"),
            ]
        ),
    ]

    var body: some View {
        //        OutlineGroup(data, children: \.children) { item in
        //            Text("\(item.description)")
        //        }
        //        .padding()
        Spacer()
    }
}

#Preview {
    OutlineGroupExample()
}
