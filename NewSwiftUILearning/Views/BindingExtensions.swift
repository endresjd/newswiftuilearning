//
//  BindingExtensions.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 3/27/25.
//

import SwiftUI

/// Shows how to extend Bindings to reduce boilerplat code in views.
///
/// Also shows how to use the non-deprecated alert modifier
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
                isPresented: $error.notNil(),
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
                isPresented: $message.isEquivalent(to: "Hello, World!"),
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

extension Binding {
    /// Present alert when a binding is not nil
    ///
    /// Let’s say you want to present an alert if the error has a non-nil value. Fairly easy task, you
    /// can create a binding that checks if error != nil and pass that to the .alert() modifier.
    /// However, repeating this for several views in your app is inefficient.
    ///
    /// - Returns: A binding around the nullable value
    /// - SeeAlso: [Binding extensions in SwiftUI](https://blog.stackademic.com/binding-extensions-in-swiftui-00065ebbd531)
    func notNil<T>() -> Binding<Bool> where T? == Value, T: Sendable {
        Binding<Bool>(
            get: {
                wrappedValue != nil
            },
            set: { newValue in
                if !newValue {
                    wrappedValue = nil
                }
            }
        )
    }
    
    /// Show an alert only if State matches the given value
    ///
    /// Building on the previous scenario, let’s say you want to present an alert only if the error is a networkError .
    /// This time, we don’t need to check if the property is nil or not; we actually need to compare it’s value against a target value.
    /// I think this assumes an Optional State variable
    ///
    /// - Parameters:
    ///   - value: State we are comparing things to
    /// - Returns: Binding that will be true if the values match
    /// - SeeAlso: [Binding extensions in SwiftUI](https://blog.stackademic.com/binding-extensions-in-swiftui-00065ebbd531)
    func isEquivalent<T>(to value: T?) -> Binding<Bool> where T? == Value, T: Equatable, T: Sendable {
        Binding<Bool>(
            get: {
                wrappedValue == value
            },
            set: { newValue in
                wrappedValue = newValue ? value : nil
            }
        )
    }
    
    /// Use a Binding if its value is nil.
    ///
    ///
    /// if you have an optional property, but want a binding that has a default value, this extension would
    /// be useful. A simple use case would be passing an optional to a Text() view, since it does not accept optional values
    ///
    /// - Parameter defaultValue: Default value for a nil property
    /// - Returns: Binding with either the actual value or the default given here
    /// - SeeAlso: [Binding extensions in SwiftUI](https://blog.stackademic.com/binding-extensions-in-swiftui-00065ebbd531)
    func unwrapped<T>(defaultValue: T) -> Binding<T> where T? == Value, T: Sendable {
        Binding<T>(
            get: {
                wrappedValue ?? defaultValue
            },
            set: {
                wrappedValue = $0
            }
        )
    }

}
