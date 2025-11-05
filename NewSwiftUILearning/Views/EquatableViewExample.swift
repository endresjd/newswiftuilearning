//
//  EquatableViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Shows 2 ways to make a view Equatable -- wrapping and view modifier.
///
/// - Important: This example is contrived and confusing.  Just use `EquatableView` or `.equatable()`,
///              conform the view to `Equatable` and optionally provide an `==` function
///
/// This lets us tell SwiftUI that we know when the view has changed, or not changed.
/// This can help with performance by avoiding unneeded redraws.
///
/// As you remember, we already talked about diffing in SwiftUI, but let me remind how it works.
/// Whenever you change the source of truth for your views,
/// SwiftUI runs body property of your view to generate a new one. As the last step, SwiftUI
/// renders a new view if something changed. The process of calculating a new body depends
/// on how deep is your view hierarchy. Happily, we can replace SwiftUI diffing with our simplified
/// version whenever we know the better way to determine changes.
///
/// **The important part here**
///
/// Sometimes we don’t need the true diffing of SwiftUI, or we want to ignore some changes in data,
/// and this is the exact place where we can use the EquatableView struct. EquatableView struct is a
/// wrapper for a View, and it also conforms to View protocol. All you need to do to use EquatableView
/// is conforming your view to Equatable protocol. Let’s take a simple look at a good example.
///
/// **Container views and equatable rendering views**
///
/// It is so easy to add Equatable conformance to your view when it only renders some data. You even
/// don’t need to override == function. You can quickly achieve this behavior by extracting your views
/// into Container and Rendering views. We already talked multiple times on my blog about Container
/// and Rendering views. Rendering views simply take some data and render it. That’s it.
///
/// Rendering views should not contain any logic or state manipulations, and it should delegate them to Container views.
/// This separation allows you to make your Rendering views conforming Equatable in an effortless way.
/// - Note: You can just conform to equatable without supplying an == function.  I think this prevents the view from being included in SwiftUI's diffing process when you know it doesn't change..
/// - Remark: Comments here are from the article from the link
/// - SeeAlso: [Optimizing views in SwiftUI using EquatableView](https://swiftwithmajid.com/2020/01/22/optimizing-views-in-swiftui-using-equatableview/)
struct EquatableViewExample: View {
    private let sleepData = [
        "one": [
            Date()
        ],
        "two": [
            Date()
        ],
    ]
    private let sleepKeys = [
        "one",
        "two",
    ]

    var body: some View {
        // This will use the Equatable conformance's function to
        // determine if the view has changed or not, which will
        // then lead to redraw if the are not.
        EquatableView(content: CalendarView(sleeps: sleepData, dates: sleepKeys))

        // The other way
        CalendarView(sleeps: sleepData, dates: sleepKeys)
            .equatable()
    }
}

/// Sleep Data.
///
/// Used in the example to populate the list
@Observable
private class Sleep {
    var first: String
    var second: String

    init(first: String, second: String) {
        self.first = first
        self.second = second
    }
}

/// Used in the example to populate the list.
private struct CalendarView: View {
    let sleeps: [String: [Date]]
    let dates: [String]

    var body: some View {
        List {
            ForEach(dates, id: \.self) { date in
                Section(header: Text("\(date)")) {
                    ForEach(sleeps[date, default: []], id: \.self) { sleep in
                        Text("\(sleep)")
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

extension CalendarView: Equatable {
    nonisolated static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.sleeps.count == rhs.sleeps.count
    }
}

#Preview {
    EquatableViewExample()
}
