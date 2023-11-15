//
//  NavigationStackExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

struct Park {
    let name: String
}

extension Park: Identifiable, Hashable {
    var id: String {
        name
    }
}

struct NavigationStackExample: View {
    let parks = [
        Park(name: "Cuyahoga Valley"),
        Park(name: "Yosemite"),
        Park(name: "Everglads"),
        Park(name: "Leatherlips")
    ]
    
    var body: some View {
        // Use a navigation stack to present a stack of views over a root view.
        // People can add views to the top of the stack by clicking or tapping a
        // NavigationLink, and remove views using built-in, platform-appropriate controls,
        // like a Back button or a swipe gesture. The stack always displays the most
        // recently added view that hasn’t been removed, and doesn’t allow the root
        // view to be removed
        NavigationStack {
            List(parks) { park in
                NavigationLink(park.name, value: park)
            }
            // Associates a destination view with a presented data type for use
            // within a navigation stack
            .navigationDestination(for: Park.self) { park in
                Text(park.name)
            }
            .navigationTitle("Parks")
        }
    }
}

#Preview {
    NavigationStackExample()
}
