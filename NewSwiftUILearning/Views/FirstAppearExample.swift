//
//  FirstAppearExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/3/25.
//

import SwiftUI

/// Modifier to run code the first time a view appears.
///
/// The regular .onAppear is called every time the view comes
/// into view in the view hierarchy, but sometimes what is wanted is
/// to run some code the first time it appears to mimic viewDidLoad
/// from UIKit.
///
/// Unclear if this is still an issue or not with .onAppear being called
/// multiple times, but if it is, then this can be a solution to it.
///
/// - SeeAlso: [Running Code Only Once in SwiftUI](https://www.swiftjectivec.com/swiftui-run-code-only-once-versus-onappear-or-task/)
/// - Important: See how we can make this public.  Xcode didn't like it when it was.
struct FirstAppearMofier: ViewModifier {
    /// Controls whether the action runs or not.
    ///
    /// The goal is to run the action only the first time the
    /// action is called.  This is the indicator of if it has
    /// been done already or not.
    @State private var hasAppeared = false

    /// Action to run when the view appears.
    private let action: () async -> Void

    init(_ action: @escaping () async -> Void) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content
            .task {
                guard !hasAppeared else {
                    return
                }

                hasAppeared = true

                await action()
            }
    }
}

extension View {
    /// View modifier to execute code on first appear.
    ///
    /// - Parameter action: Closure to run
    /// - Returns: Modified view
    func onFirstAppear(_ action: @escaping () async -> Void) -> some View {
        modifier(FirstAppearMofier(action))
    }
}

struct FirstAppearExample: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                print("onAppear")
            }
            .onFirstAppear {
                print("onFirstAppear")
            }
    }
}

#Preview {
    FirstAppearExample()
}
