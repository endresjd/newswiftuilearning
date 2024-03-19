//
//  DatePickerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Examples of using iOS 13's DatePicker in multiple styles
///
/// The styles used in this example are
///
///     1. A graphical picker that shows the entire month
///     2. A compact version that just shows the date with the picker in a popup
///     3. A compact date and time picker that is limited to a certain time range.
///
/// - Experiment: Try these with different styles.  `.graphical` for the date/time picker, for example.
struct DatePickerExample: View {
    @State private var date = Date()
    @State private var closedRangeDate = Date()
    @State private var styledDate = Date()

    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 12, day: 15)
        let endComponents = DateComponents(year: 2021, month: 12, day: 28, hour: 23, minute: 59, second: 59)
        
        return calendar.date(from:startComponents)! ... calendar.date(from:endComponents)!
    }()

    var body: some View {
        ScrollView {
            VStack {
                DatePicker(
                    "Styled",
                    selection: $styledDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)

                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )

                DatePicker(
                    "Closed Range",
                     selection: $closedRangeDate,
                     in: dateRange,
                     displayedComponents: [.date, .hourAndMinute]
                )
            }
            .padding()
        }
    }
}

#Preview {
    DatePickerExample()
}
