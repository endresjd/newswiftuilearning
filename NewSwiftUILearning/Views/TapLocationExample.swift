//
//  TapLocationExample.swift
//  NewSwiftUILearning
//
//  Created by Endres, John on 3/7/24.
//

import SwiftUI

/// Shows a way to get the tap location in a view.
///
/// Shows a way to get the tap location in a view without needing to bridge to UIKit either
/// relative to the view or relative to other coordinates.
///
/// “Relative location” means relative to the view's bounds – if the view is 100x100 in size, if you tap the exact center it
/// would print 50x50 regardless of where the view was placed on the screen.
///
/// If you want the global location – i.e., where your tap took place relative to the top-left corner of the entire screen – you
/// should add the coordinateSpace parameter like to the `.onTapGesture` modifier.
///
/// - Experiment: Experiment with the `coordinateSpace` parameter to get different results.
/// - Requires: iOS 16
/// - Seealso: [How to detect the location of a tap inside a view](https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-the-location-of-a-tap-inside-a-view)
struct TapLocationExample: View {
    /// The last tap in the view.
    @State private var tappedLocation: CGPoint?

    var body: some View {
        if let tappedLocation {
            Text("Tapped at: \(tappedLocation.debugDescription)")
        } else {
            Text("Not tapped yet")
        }

        Circle()
            .fill(.red)
            .frame(width: 100, height: 100)
            .onTapGesture { location in
                tappedLocation = location
            }
    }
}

#Preview {
    TapLocationExample()
}
