//
//  GroupBoxExampleView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Examples of various styles of iOS 14's GroupBox views
///
/// - Experiment: See how the VStack can be properly algined to leading without applying `.frame(maxWidth: .infinity)` to
///               every element
/// - SeeAlso: [Apple](https://developer.apple.com/documentation/swiftui/groupbox),
///            [Hacking with Swift](https://www.hackingwithswift.com/quick-start/swiftui/how-to-group-views-visually-using-groupbox)
struct GroupBoxExampleView: View {
    @State private var userAgreed = false
    private let agreementText = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    """
    
    var body: some View {
        ScrollView {
            GroupBox {
                Text("Your account")
                    .font(.headline)
                Text("Username: tswift89")
                Text("City: Nashville")
            }
            
            // Apple's example from the docs
            GroupBox(label:
                Label("End-User Agreement", systemImage: "building.columns")
            ) {
                ScrollView(.vertical, showsIndicators: true) {
                    Text(agreementText)
                        .font(.footnote)
                }
                .frame(height: 100)
                Toggle(isOn: $userAgreed) {
                    Text("I agree to the above terms")
                }
            }

            GroupBox {
                Text("Outer Content")
                
                GroupBox {
                    Text("Middle Content")
                    
                    GroupBox {
                        Text("Inner Content")
                    }
                }
            }
            
            GroupBox("Your account") {
                VStack(alignment: .leading) {
                    Text("Username: tswift89")
                    Text("City: Nashville")
                }
            }
        }
    }
}

#Preview {
    GroupBoxExampleView()
}
