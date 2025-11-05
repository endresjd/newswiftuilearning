//
//  TypedThrowsView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 3/26/25.
//

import SwiftUI

/// Illustrated typed throws in Swift 6.
///
/// Typed throws are a valuable addition to Swift, allowing us to write more predictable code. SDKs, in particular, can benefit
/// from this feature by better predicting the error to expect. More compile-time checks help us avoid forgetting about handling
/// any new error cases in the future.
///
/// - SeeAlso: [Typed throws in Swift explained with code examples](https://www.avanderlee.com/swift/typed-throws/)
struct TypedThrowsView: View {
    var body: some View {
        Text("Code only!")
    }
}

#Preview {
    TypedThrowsView()
}

struct UsernameValidator {
    enum ValidationError: Error {
        case emptyName
        case nameTooShort(nameLength: Int)
    }

    static func validate(name: String) throws(ValidationError) {
        guard !name.isEmpty else {
            throw ValidationError.emptyName
        }

        guard name.count > 2 else {
            throw ValidationError.nameTooShort(nameLength: name.count)
        }
    }

    static func example(name: String) {
        // To explicitly define the expected error that will be caught
        // write the do/catch in this way.  Note: Specifying the error type
        // inside a do-catch clause is only valuable in case you want to prevent
        // the same do-closure from throwing other errors
        do throws(UsernameValidator.ValidationError) {
            try UsernameValidator.validate(name: name)
        } catch {
            switch error {
            case .emptyName:
                print("You've submitted an empty name!")
            case .nameTooShort(let nameLength):
                print("The submitted name is too short! (\(nameLength))")
            }
        }

        // Swift can also infer the kind of error being caught in this case
        do {
            try UsernameValidator.validate(name: name)
        } catch {
            switch error {
            case .emptyName:
                print("You've submitted an empty name!")
            case .nameTooShort(let nameLength):
                print("The submitted name is too short! (\(nameLength))")
            }
        }
    }
}
