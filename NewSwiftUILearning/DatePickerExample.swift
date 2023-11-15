//
//  DatePickerExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

struct DatePickerExample: View {
    @State private var date = Date()
    @State private var closedRangeDate = Date()
    @State private var styledDate = Date()

    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()

    var body: some View {
        ScrollView {
            VStack {
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
                
                DatePicker(
                    "Styled",
                    selection: $styledDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)

            }
            .padding()
        }
    }
}

#Preview {
    DatePickerExample()
}
