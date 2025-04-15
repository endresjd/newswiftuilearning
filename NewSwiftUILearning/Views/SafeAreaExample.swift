//
//  SafeAreaExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/15/25.
//

import SwiftUI

/// Look at how to respect the safe area.
///
/// The safe area is the screen portion that remains unobstructed by system UI
/// elements such as the status bar, navigation bar, tab bar, Dynamic Island, and
/// home indicator.
///
/// By default, SwiftUI ensures that views are placed within this safe area to maintain
/// visibility and accessibility. However, there are cases where developers need more
/// control over how views interact with these boundaries.
///
/// - SeeAlso:
///     * [Placing UI components within the Safe Area Inset](https://www.createwithswift.com/placing-ui-components-within-the-safe-area-inset)
///     * [Adding a background to your view](https://www.createwithswift.com/placing-ui-components-within-the-safe-area-inset)
struct SafeAreaExample: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Top bar in safe area?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Text("Safe Area Insets Example")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Text("Bottom bar in safe area?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        // Adds the provided insets into the safe area of this view.
        .safeAreaPadding([.top, .bottom], 64.0)
        // allows us to insert additional content along a specified edge of a view’s safe area.
        .safeAreaInset(edge: .top, spacing: 0) {
            safeAreaComponent(text: "Top Bar", symbolName: "globe")
        }
        // allows us to insert additional content along a specified edge of a view’s safe area.
        .safeAreaInset(edge: .bottom, spacing: 0) {
            safeAreaComponent(text: "Bottom Bar", symbolName: "star.fill")
        }
    }
    
    func safeAreaComponent(text: String, symbolName: String) -> some View {
        HStack {
            Text(text)
                .foregroundColor(.white)
            Image(systemName: symbolName)
                .foregroundColor(.yellow)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.black.opacity(0.3))
    }
}

#Preview {
    SafeAreaExample()
}
