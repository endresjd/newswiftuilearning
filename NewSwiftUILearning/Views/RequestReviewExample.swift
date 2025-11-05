//
//  RequestReviewExample.swift
//  NewSwiftUILearning
//
//  Created by Endres, John on 3/8/24.
//

import StoreKit
import SwiftUI

/// Shows how to add a button that displays a `review the app` alert.
///
/// If you import StoreKit into your SwiftUI app, you’ll gain access to an environment key called requestReview, which allows you to prompt the user to leave a review for your app.
///
/// To use it, first important StoreKit into your project, add the environment key as property in your view, then call it at an appropriate time. Here’s some code to get you started
///
/// - Requires: iOS 16
/// - Seealso: [How to ask the user to review your app](https://www.hackingwithswift.com/quick-start/swiftui/how-to-ask-the-user-to-review-your-app)
struct RequestReviewExample: View {
    @Environment(\.requestReview) var requestReview

    var body: some View {
        Button("Review the app") {
            requestReview()
        }
    }
}

#Preview {
    RequestReviewExample()
}
