//
//  MultiDatePickerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

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
