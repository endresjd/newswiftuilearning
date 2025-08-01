//
//  StretchyViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/11/25.
//

import SwiftUI
import Macplugins

struct StretchyViewExample: View {
    @State private var allowStretching = true
    
    @ViewBuilder
    var dogImage: some View {
        Image("dog")
            .resizable()
            .scaledToFill()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if allowStretching {
                    dogImage
                        .stretchy()
                } else {
                    dogImage
                }
                
                Text("Here is a very cute dog.")
                    .padding(.bottom)
                
                Toggle("Allow Stretching", isOn: $allowStretching)
                    .padding([.top, .horizontal])
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    StretchyViewExample()
}
