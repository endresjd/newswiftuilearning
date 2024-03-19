//
//  GroupExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

/// Using iOS 13's Group to act on a set of Text views as if they were a single unit.
///
/// If you need several views to act as one – for example, to transition together – then you should use SwiftUI’s Group view.
/// This example has 2 groups.  The second has `.foregroundColor` applied to it.
struct GroupExample: View {
    var body: some View {
        // Note: the limit to the static views in something like a VStack
        // seems gone.  Had about 20 or so with no error.
        VStack {
            Group {
                Text("Line 1")
                Text("Line 2")
                Text("Line 3")
                Text("Line 4")
                Text("Line 5")
                Text("Line 6")
            }

            Group {
                Text("Line 7")
                Text("Line 8")
                Text("Line 9")
                Text("Line 10")
                Text("Line 11")
            }
            .foregroundColor(Color.blue)
        }
    }
}

#Preview {
    GroupExample()
}
