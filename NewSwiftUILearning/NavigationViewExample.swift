//
//  NavigationViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

struct NavigationViewExample: View {
    let values = ["one", "two", "three"]
    
    var body: some View {
        NavigationView {
            List(values, id: \.self) { value in
                NavigationLink(value, destination: Text(value))
            }
            
            Text("Select a word")
        }
    }
}

#Preview {
    NavigationViewExample()
}
