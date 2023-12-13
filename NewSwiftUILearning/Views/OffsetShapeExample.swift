//
//  OffsetShapeExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

struct OffsetShapeExample: View {
    var body: some View {
        // Not getting this one.
        OffsetShape(shape: Rectangle(), offset: CGSize(width: 10, height: 10))
            .size(width: 200, height: 200)
        
        Rectangle()
            .size(width: 200, height: 200)
    }
}

#Preview {
    OffsetShapeExample()
}
