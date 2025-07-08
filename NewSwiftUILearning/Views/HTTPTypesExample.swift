//
//  HTTPTypesExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 3/20/24.
//

import SwiftUI
import HTTPTypes
import HTTPTypesFoundation

/// Uses HTTPTypes to download a web page
///
/// Uses swift-http-types to download and print out the contents of www.example.com without
/// direct use of Foundation's `URL` type.  Especially constructing a URL, so no optional check when trying
/// to construct it.  Bad URLs result in an error being thrown, probably from the `NSPOSIXErrorDomain`
/// domain.
///
/// - Note: This seems back ported to the beginning of SwiftUI?
/// - Experiment: Try this in more detail!
/// - Requires: [swift-http-types](https://github.com/apple/swift-http-types)
struct HTTPTypesExample: View {
    /// The eventual result of the `URLSession.shared.data` call.
    @State private var result = HTTPResponse(status: .ok)
    
    /// The eventual data of the `URLSession.shared.data` call.
    @State private var bodyText = "Not fetched"
    
    var body: some View {
        ScrollView {
            Text("Status code: \(String(describing: result))")

            Divider()

            Text(bodyText)
            
            Divider()
            
            Button("Fetch") {
                Task {
                    await example()
                }
            }
        }
    }
    
    /// Uses HTTPTypes to download a web page
    ///
    /// Uses swift-http-types to download and print out the contents of www.example.com without
    /// direct use of Foundation's `URL` type.  Especially constructing a URL, so no optional check when trying
    /// to construct it.  Bad URLs result in an error being thrown, probably from the `NSPOSIXErrorDomain`
    /// domain.
    ///
    /// - Requires: [swift-http-types](https://github.com/apple/swift-http-types)
    func example() async {
        let request = HTTPRequest(method: .get, scheme: "https", authority: "www.example.com", path: "/")
        
        do {
            let (responseBody, response) = try await URLSession.shared.data(for: request)
            
            result = response
            
            if let body = String(data: responseBody, encoding: .utf8) {
                bodyText = body
            } else {
                bodyText = "Bad encoding?  \(responseBody)"
            }
        } catch {
            bodyText = String(describing: error)
        }
    }

}

#Preview {
    HTTPTypesExample()
}
