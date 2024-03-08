//
//  SystemOverlays.swift
//  NewSwiftUILearning
//
//  Created by Endres, John on 3/8/24.
//

import SwiftUI

/// Show how to hide system indicates like home, multiask, and more
///
/// SwiftUI’s persistentSystemOverlays() modifier lets us show or hide the so-called
/// “non-transient system views” that are automatically placed over our UI – Apple’s
/// name for the home indicator, the multitask indicator on iPad, and more.
///
/// These non-transient system views include:
/// * The Home indicator
/// * The SharePlay indicator
/// * The Multi-task indicator and Picture-in-picture on iPad
/// - Remark: This is a request to hide the overlays – it’s down to the system to decide what it actually do
/// 
/// - Important: iOS 16 minimum
/// - Seealso: [How to hide the home indicator and other system UI](https://www.hackingwithswift.com/quick-start/swiftui/how-to-hide-the-home-indicator-and-other-system-ui)
struct SystemOverlays: View {
    var body: some View {
        Text("This needs to take up lots of space")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.yellow)
            .persistentSystemOverlays(.hidden)
    }
}

#Preview {
    SystemOverlays()
}
