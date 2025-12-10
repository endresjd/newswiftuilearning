//
//  TableExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

/// Tries to show how to show multiple column lists with tables.
///
/// SwiftUI’s Table view type let us create lists with multiple columns, including selection and sorting. They work
/// quite differently from regular lists because we pass the Table an array of data to show then specify values to
/// display using key paths, each time also passing a title to show in the header area.
///
/// Shows the following
/// 1. Simple Table columns
/// 2. A Table with sortable columns.  Sort by clicking on the header.
/// 3. A Table with columns set to a specfic size.
///
/// - Important: Choose an iPad device to see the other columns.  iOS only shows 1 column
/// - Requires: iOS 16
/// - Seealso: [How to create multi-column lists using Table](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-multi-column-lists-using-table)
struct TableExample: View {
    struct Person: Identifiable {
        let givenName: String
        let familyName: String
        let emailAddress: String
        let id = UUID()

        var fullName: String { givenName + " " + familyName }
    }

    @State private var people = [
        Person(givenName: "Juan", familyName: "Chavez", emailAddress: "juanchavez@icloud.com"),
        Person(givenName: "Mei", familyName: "Chen", emailAddress: "meichen@icloud.com"),
        Person(givenName: "Tom", familyName: "Clark", emailAddress: "tomclark@icloud.com"),
        Person(givenName: "Gita", familyName: "Kumar", emailAddress: "gitakumar@icloud.com"),
    ]

    var body: some View {
        Table(people) {
            TableColumn("Given Name", value: \.givenName)
            TableColumn("Family Name", value: \.familyName)
            TableColumn("E-Mail Address", value: \.emailAddress)
        }
    }
}

#Preview(traits: .portrait) {
    TableExample()
}
