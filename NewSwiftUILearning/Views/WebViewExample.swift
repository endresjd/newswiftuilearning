//
//  WebViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/7/25.
//

import SwiftUI
import WebKit

/// Give the Web page a policy that says you have to stay on the swift web site
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
struct WebViewExample: View {
//    @State private var page = WebPage()
    
    /// Extra information about the web view
    @State private var page = {
        WebPage(navigationDecider: NavigationDecider())
    }()

    var body: some View {
        VStack {
            Text(page.title)
            WebView(page)
        }
        .onAppear {
            page.load(URLRequest(url: URL(string: "https://www.swift.org")!))
        }
    }
}

#Preview {
    WebViewExample()
}
