//
//  MultiDatePickerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Shows how to use iOS 16's  `MultiDatePicker`
///
/// SwiftUI’s MultiDatePicker shows a calendar view where the user is able to select a variety of dates at the same time, either from any possible date or from a date range of your choosing.
///
/// Illustrates two use cases:
/// 1. Simple DatePicker with no limits
/// 2. A Date Picker with a limited range of dates to use.
///
/// - Remark: Not sure if this can be told to ignore dates in a range.
/// - Requires: iOS 16
/// - Seealso: [How to let the user select multiple dates](https://www.hackingwithswift.com/quick-start/swiftui/how-to-let-the-user-select-multiple-dates)
struct MultiDatePickerExample: View {
    @Environment(\.calendar) var calendar
    @Environment(\.timeZone) var timeZone

    var bounds: Range<Date> {
        let start = calendar.date(from: DateComponents(
            timeZone: timeZone, year: 2022, month: 6, day: 6))!
        let end = calendar.date(from: DateComponents(
            timeZone: timeZone, year: 2022, month: 6, day: 16))!
        return start ..< end
    }


    @State private var dates: Set<DateComponents> = []
    @State private var limitedDates: Set<DateComponents> = []

    var body: some View {
        MultiDatePicker("Dates Available", selection: $dates)
        MultiDatePicker("Dates Available", selection: $limitedDates, in: bounds)
    }
}

#Preview {
    MultiDatePickerExample()
}

#Preview {
    MultiDatePicker("Dates Available", selection: .constant([]))
        .environment(\.locale, Locale.init(identifier: "zh"))
        .environment(
            \.calendar, Calendar.init(identifier: .chinese))
        .environment(\.timeZone, TimeZone(abbreviation: "HKT")!)
}
