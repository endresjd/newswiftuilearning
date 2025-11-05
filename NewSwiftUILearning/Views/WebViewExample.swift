//
//  WebViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/7/25.
//

import SwiftUI
import WebKit

/// Give the Web page a policy that says you have to stay on the swift web site.
@available(iOS 26.0, *)
private struct NavigationDecider: WebPage.NavigationDeciding {
    func decidePolicy(for response: WebPage.NavigationResponse) async -> WKNavigationResponsePolicy {
        if response.response.url?.absoluteString.starts(with: "https://www.swift.org") == true {
            .allow
        } else {
            .cancel
        }
    }
}

/// Shows the new WebView view that seems to be back ported to 18.4?
///
/// - You can do literally everything with this, including calling custom JavaScript – it's a massive win for developers.
///
/// - SeeAlso: [How to embed web content using WebView](https://www.hackingwithswift.com/quick-start/swiftui/how-to-embed-web-content-using-webview)
@available(iOS 26.0, *)
struct WebViewExample: View {
    /// Extra information about the web view.
    @State private var page = {
        WebPage(navigationDecider: NavigationDecider())
    }()

    var body: some View {
        VStack {
            Text(page.title)
            WebView(page)
        }
        .onAppear {
            if let url = URL(string: "https://www.swift.org") {
                page.load(URLRequest(url: url))
            }
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        WebViewExample()
    } else {
        FutureFeatureView()
    }
}
