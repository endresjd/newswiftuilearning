//
//  ViewExtensions.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/16/25.
//

import SwiftUI

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    /// - SeeAlso: [How to create a Conditional View Modifier in SwiftUI](https://www.avanderlee.com/swiftui/conditional-view-modifier/)
    @ViewBuilder
    func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}
