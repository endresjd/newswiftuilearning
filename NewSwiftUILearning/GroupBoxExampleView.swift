//
//  GroupBoxExampleView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Examples of various styles of GroupBox views
struct GroupBoxExampleView: View {
    var body: some View {
        ScrollView {
            GroupBox {
                Text("Your account")
                    .font(.headline)
                Text("Username: tswift89")
                Text("City: Nashville")
            }
            
            GroupBox {
                VStack(alignment: .leading) {
                    Text("Your account")
                        .font(.headline)
                    Text("Username: tswift89")
                    Text("City: Nashville")
                }
            }
            
            GroupBox {
                Text("Outer Content")
                
                GroupBox {
                    Text("Middle Content")
                    
                    GroupBox {
                        Text("Inner Content")
                    }
                }
            }
            
            GroupBox("Your account") {
                VStack(alignment: .leading) {
                    Text("Username: tswift89")
                    Text("City: Nashville")
                }
            }
        }
    }
}

#Preview {
    GroupBoxExampleView()
}
