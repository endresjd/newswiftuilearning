//
//  NavigationStackExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Simple example of NavigationStack
///
/// We can use SwiftUI to programmatically push a new view onto a NavigationStack using NavigationLink, meaning
/// that we can trigger the navigation when we’re ready rather than just when the user tapped a button or list row.
///
/// From iOS 16 and later, we can pass an array of Hashable data directly to the NavigationStack to control which 
/// data is currently on the stack. For example, this tracks numbers being presented, and starts by immediately pushing
/// 1, 4, and 8 onto the stack
///
/// This approach is powerful, because we can at any point modify the navigation stack to push a custom view on
/// there – it’s a simple array, so we can append items, or insert them, remove them, or whatever else we need.
/// In this code sample the path array starts empty, then gets added to over time by using the List or clicking buttons
///
/// - Remark: The path here holds the navigation state.  That value can be saved and restored or programmatically set.
/// - Requires: iOS 16
/// - Important: This example works fine in previews but not so fine in the app right now.  Embeded stacks don't work.
/// - Important: The path parameter gives a pop to root functionality back by alterning the path.  In this case popping back by removing the last entry.
/// - Seealso: [How to use programmatic navigation in SwiftUI](https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-programmatic-navigation-in-swiftui)
/// - Seealso: [NavigationStack](https://developer.apple.com/documentation/swiftui/navigationstack)
struct NavigationStackExample: View {
    /// This is the contents of the stack.  When a number is pushed onto this stack then
    /// this array will have that appended to it.  To start at the top, have this be an empty array
    @State private var presentedNumbers = [1, 4, 8]

    var body: some View {
        NavigationStack(path: $presentedNumbers) {
            List(1..<50) { i in
                NavigationLink(value: i) {
                    Label("Row \(i)", systemImage: "\(i).circle")
                }
            }
            .navigationDestination(for: Int.self) { i in
                VStack {
                    Text("Detail \(i)")

                    Button("Go to Next") {
                        presentedNumbers.append(i + 1)
                    }
                    
                    Button("Go Back") {
                        presentedNumbers.removeLast()
                    }
                }
            }
            .navigationTitle("Navigation")
        }
    }
}

#Preview {
    NavigationStackExample()
}
