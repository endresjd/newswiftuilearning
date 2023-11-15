//
//  AsyncImageExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

struct AsyncImageExample: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/John_Lennon_1969_%28cropped%29.jpg/440px-John_Lennon_1969_%28cropped%29.jpg"))
    }
}

#Preview {
    AsyncImageExample()
}
