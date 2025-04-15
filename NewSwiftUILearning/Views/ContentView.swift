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
    
    /// Contents for a navigation view that isn't selection based
    var contents: some View {
        // List doesn't need selection because the next column is determined
        // by the navigationDestination modifier.
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
        .task {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    /// Split view where detail is determined by selection
    var selectionBody: some View {
        // A selection based split view
        NavigationSplitView {
            // List needs the selection for the next column
            List(selection: $selection) {
                ForEach(searchResults, id: \.self) { view in
                    NavigationLink(view.rawValue, value: view)
                }
            }
            .listStyle(.plain)
            .searchable(text: $searchTerm)
        } detail: {
            NavigationStack {
                if let selection {
                    selection
                        .view
                        .navigationTitle(selection.name)
                } else {
                    ContentUnavailableView("Use sidebar navigation", systemImage: "sidebar.left")
                }
            }
        }
        .task {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    /// Adaptive navigation
    ///
    /// Selection-based list is not the only way to navigate through columns of the split view. You
    /// can provide destination points by using the navigationDestination view modifier. In this case,
    /// SwiftUI will navigate to the particular view in the column coming next to the one with the
    /// navigationDestination view modifier. But make sure, you don’t embed the view with navigationDestination
    /// view modifier into the NavigationStack, because in this case it will push the view to the current
    /// NavigationStack.
    ///
    /// - Important: It feels weird for this because the row doesn't select in the first column
    var adaptiveBody: some View {
        NavigationSplitView {
            contents
        } detail: {
            // Detail is handled through navigationDestination except for this edge case
            if selection == nil {
                ContentUnavailableView("Use sidebar navigation", systemImage: "sidebar.left")
            }
        }
    }
    
    var body: some View {
        selectionBody
        // adaptiveBody
    }
}

#Preview {
    ContentView()
}
