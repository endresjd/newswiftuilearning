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

private struct Tree<Value: Hashable>: Hashable {
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
    fileprivate let data =
      FileItem(name: "users", children:
        [FileItem(name: "user1234", children:
          [FileItem(name: "Photos", children:
            [FileItem(name: "photo001.jpg"),
             FileItem(name: "photo002.jpg")]),
           FileItem(name: "Movies", children:
             [FileItem(name: "movie001.mp4")]),
              FileItem(name: "Documents", children: [])
          ]),
         FileItem(name: "newuser", children:
           [FileItem(name: "Documents", children: [])
           ])
        ])
    fileprivate let categories: [Tree<String>] = [
        .init(
            value: "Clothing",
            children: [
                .init(value: "Hoodies"),
                .init(value: "Jackets"),
                .init(value: "Joggers"),
                .init(value: "Jumpers"),
                .init(
                    value: "Jeans",
                    children: [
                        .init(value: "Regular"),
                        .init(value: "Slim")
                    ]
                ),
            ]
        ),
        .init(
            value: "Shoes",
            children: [
                .init(value: "Boots"),
                .init(value: "Sliders"),
                .init(value: "Sandals"),
                .init(value: "Trainers"),
            ]
        )
    ]

    var body: some View {
        OutlineGroup(data, children: \.children) { item in
            Text("\(item.description)")
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    OutlineGroupExample()
}
