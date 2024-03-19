//
//  ContentView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Top-level container for the view that shows a list of all views that are defined in the
/// router enum.
///
/// 1. This shows how to use what I call a view router that **does not** require wrapping to `AnyView` but
/// instead uses a `ViewBuilder` to achieve its results.
/// 2. Wraps that list with a searchable field
/// 3. Uses `NavigationStack` for navigation using `.navigationDestination` with the router's enum value.
/// 4. Shows how to run a `Task` before the view first loads.
///
/// - Requires: iOS 16
/// - Seealso: [How to add a search bar to filter your data](https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-a-search-bar-to-filter-your-data)
/// - Seealso: [How to use programmatic navigation in SwiftUI](https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-programmatic-navigation-in-swiftui)
struct ContentView: View {
    /// Holds the selected navigation item that we use to provide the destination
    /// view we will route to.  This is nil by default to indicate there is no routing needed.
    @State private var selection: ViewRouter? = nil
    
    /// Holds the typed in search term that will be used to filter the views in the
    /// on-screen list.
    @State private var searchTerm = ""
    
    @State private var navPath = NavigationPath()

    /// Some of the examples in the router require location information.  This is used
    /// here, the top level, to request authorization for the whole app.
    private let locationManager = LocationManager()
    
    /// Returns a list of views that will show in the list based on the value of `searchTerm`
    private var searchResults: [ViewRouter] {
        guard !searchTerm.isEmpty else {
            return ViewRouter.allCases.sorted { left, right in
                if left.version > right.version {
                    return true
                }
                
                return left.name < right.name
            }
        }

        let results = ViewRouter.allCases.filter { router in
            router.name.lowercased().contains(searchTerm.lowercased())
        }
        
        return results
    }
    
    var body: some View {
        NavigationStack(path: $navPath) {
            List(searchResults) { view in
                NavigationLink(view.rawValue, value: view)
            }
            .listStyle(.plain)
            .searchable(text: $searchTerm)
            .navigationDestination(for: ViewRouter.self) { selectedView in
                selectedView
                    .view
                    .navigationTitle(selectedView.name)
            }
        }
        .task {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    ContentView()
}
