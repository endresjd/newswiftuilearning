//
//  EquatableViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// See [Optimizing views in SwiftUI using EquatableView](https://swiftwithmajid.com/2020/01/22/optimizing-views-in-swiftui-using-equatableview/)
struct EquatableViewExample: View {
    var body: some View {
        // This will use the Equatable conformance's function to
        // determine if the view has changed or not, which will
        // then lead to redraw if the are not.
        EquatableView(content: CalendarView())
    }
}

struct CalendarView: View {
    private let sleeps: [Date: [String]] = [Date(): ["one", "two"]]
    private let dates: [Date] = [Date()]

    var body: some View {
        List {
            ForEach(dates, id: \.self) { date in
                Section(header: Text("\(date)")) {
                    Text("Sleep data here")
//                    ForEach(sleeps[date, default: []], id: \.id) { sleep in
//                        Text("Sleep data here")
//                    }
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

extension CalendarView: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.sleeps.count == rhs.sleeps.count
    }
}


#Preview {
    EquatableViewExample()
}
