//
//  AnyLayoutExample.swift
//  NewSwiftUILearning
//
//  Created by Endres, John on 3/8/24.
//

import SwiftUI

/// Shows 2 ways to dynamically shift the stacking by using some of the layout containers in iOS 16.
///
/// SwiftUI’s AnyLayout struct allows us to switch between HStack and VStack freely, based on whatever
/// environment context we want to take into account – just remember to use the Layout-conforming variants of each.
///
/// This example shows how:
/// 1. Adjust based off of the horizontal size class
/// 2. Adjust based off of the size of the text (dynamic text size)
/// 3. Preview in landscape mode
///
/// - Remark: This size class one may be too simple for an iOS example here.
/// - Remark: This also shows how to customize the Preview macro for landscape mode.
/// - Experiment: Try out different layouts.  `ZStackLayout` or `GridLayout`, for example.
/// - Requires: iOS 16
/// - Seealso: [How to dynamically change between VStack and HStack](https://www.hackingwithswift.com/quick-start/swiftui/how-to-dynamically-change-between-vstack-and-hstack)
struct AnyLayoutExample: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var body: some View {
        let layout = horizontalSizeClass == .regular ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        let typeLayout = dynamicTypeSize <= .xxxLarge ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())

        ScrollView {
            Text(horizontalSizeClass == .regular ? "Regular" : "Compact")
            Text(String(describing: dynamicTypeSize))

            Divider()

            layout {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }
            .font(.largeTitle)

            Divider()

            typeLayout {
                Text("John")
                Text("Donald")
                Text("Endres")
            }
        }
    }
}

#Preview {
    AnyLayoutExample()
}

#Preview(traits: .landscapeLeft) {
    AnyLayoutExample()
}
