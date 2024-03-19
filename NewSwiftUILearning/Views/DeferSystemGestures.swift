//
//  DeferSystemGestures.swift
//  NewSwiftUILearning
//
//  Created by Endres, John on 3/8/24.
//

import SwiftUI

/// Shows how to gain priority on gestures
///
/// This is a way to prevent the system from responding to a gesture.  In this case, the view wants
/// to handle vertical gestures.
///
/// SwiftUI’s defersSystemGestures() modifier lets us request that our gestures take precedence over the system’s own built-in gestures.
/// This is important in various places, such as games where the user might be swiping around a lot, or when you place your own gestures
/// at the screen edges
///
/// - Remark: Important for games.  Maybe camera stuff?
/// - Requires: iOS 16
/// - Seealso: [How to stop system gestures from interfering with your own](https://www.hackingwithswift.com/quick-start/swiftui/how-to-stop-system-gestures-from-interfering-with-your-own)
struct DeferSystemGestures: View {
    @State private var input = 0.0

    var body: some View {
        Text("Current value: \(input)")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle())
            .gesture(
                DragGesture().onChanged { value in
                    input = value.location.y - value.startLocation.y
                }
            )
            .defersSystemGestures(on: .vertical)
    }
}

#Preview {
    DeferSystemGestures()
}
