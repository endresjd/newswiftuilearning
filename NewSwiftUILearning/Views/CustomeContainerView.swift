//
//  CustomeContainerView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/11/24.
//

import SwiftUI

struct CustomeContainerView: View {
    var body: some View {
        Text("May need investigation")
        Text("Code is incomplete")
    }
}

//struct DisplayBoard<Content: View>: View {
//  @ViewBuilder var content: Content
//
//  var body: some View {
//    DisplayBoardCardLayout {
//      ForEach(subviewOf: content) { subview in
//        CardView {
//          subview
//        }
//      }
//    }
//    .background { BoardBackgroundView() }
//  }
//}
//
//DisplayBoard {
//  Text("Scrolling in the Deep")
//  Text("Born to Build & Run")
//  Text("Some Body Like View")
//
//  ForEach(songsFromSam) { song in
//    Text(song.title)
//  }
//}

#Preview {
    CustomeContainerView()
}
