//
//  BindingExtensions.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 3/27/25.
//

import SwiftUI
import Macplugins

/// Shows how to extend Bindings to reduce boilerplat code in views.
///
/// Also shows how to use the non-deprecated alert modifier.  The modified code from the article
/// was moved into the Macplugins package.
///
/// - SeeAlso: [Binding extensions in SwiftUI](https://blog.stackademic.com/binding-extensions-in-swiftui-00065ebbd531)
struct BindingExtensions: View {
    enum CustomError: String {
        case networkError
        case fileError
    }

    @State private var error: CustomError?
    @State private var message: String?
    @State private var unknownMessage: String?
    @State private var deprecatedAlert = false
    @State private var notDeprecatedAlert = false

    var body: some View {
        VStack {
            // Not sure this is the correct usage.  The article didn't give a good example
            Text("\($unknownMessage.unwrapped(defaultValue: "No message Yet").wrappedValue)")
                .padding(.bottom)
            
            Button("Unknown message") {
                if unknownMessage == nil {
                    unknownMessage = "Something went wrong"
                } else {
                    unknownMessage = nil
                }
            }
            
            Button("non-nil") {
                error = .networkError
            }
            .alert(
                "Something went wrong",
                isPresented: $error.hasValue(),
                // This is `argument` in the closures, and must not be nil
                presenting: error,
                actions: { argument in
                    // Puts a button with red text for the label
                    Button(role: .destructive) {
                    } label: {
                        Text("No")
                    }
                    
                    // This is how to put in a cancel button with
                    // a different title.  Without this, SwiftUI
                    // will add its own Cancel button for you.
                    // Interesting that this one will always be put
                    // at the bottom of the alert.
                    Button(role: .cancel) {
                    } label: {
                        Text("Yes")
                    }
                }, message: { argument in
                    Text(String(describing: argument))
                }
            )
            
            Button("Brian Kernighan") {
                message = "Hello, World!"
            }
            .alert(
                "Says",
                isPresented: $message.matches("Hello, World!"),
                presenting: message,
                actions: { message in
                    // Interesting that if these are Text elements there
                    // is a lag in rendering where you see them move from
                    // disabled to enabled.  At least in Previews.
                    Button("Hello") {
                    }
                    
                    Button("World") {
                    }
                },
                message: { message in
                    Text(message)
                }
            )
            
            Button("Deprecated Alert") {
                deprecatedAlert.toggle()
            }
            .alert(isPresented: $deprecatedAlert) {
                Alert(
                    title: Text("Title"),
                    primaryButton: .default(
                        Text("John"),
                        action: {
                        }
                    ),
                    secondaryButton: .destructive(
                        Text("Crap"),
                        action: {
                        }
                    )
                )
            }
        }
    }
}

#Preview {
    BindingExtensions()
}
