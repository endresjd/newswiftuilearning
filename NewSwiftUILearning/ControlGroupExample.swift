//
//  ControlGroupExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// The ControlGroup view displays semantically-related controls in a visually appropriate manner for the context
///
/// See [ControlGroup](https://swiftwithmajid.com/2021/10/21/mastering-controlgroup-in-swiftui/)
struct ControlGroupExample: View {
    var body: some View {
        VStack(spacing:50){
            Menu {
                ControlGroup{
                    Button(action: {}, label: {
                        Image(systemName: "scissors")
                    })
                    Button(action: {}, label: {
                        Image(systemName: "doc.on.doc")
                    })
                    Button(action: {}, label: {
                        Image(systemName: "doc.on.clipboard")
                    })
                    Button(action: {}, label: {
                        Image(systemName: "doc.text.magnifyingglass")
                    })
                }
                .controlGroupStyle(.compactMenu)
                
                Button(action: {}, label: {
                    Label("Translate", systemImage: "trash")
                })
                
                Button(action: {}, label: {
                    Label("share", systemImage: "square.and.arrow.up")
                })
            } label: {
                Text("Menu 1")
            }
            
            Menu {
                ControlGroup{
                    Button(action: {}, label: {
                        Label("Cut", systemImage: "scissors")
                    })
                    
                    Button(action: {}, label: {
                        Label("Copy", systemImage: "doc.on.doc")
                    })
                    
                    Button(action: {}, label: {
                        Label("Paste", systemImage: "doc.on.clipboard")
                    })
                }.controlGroupStyle(.menu)
                
                Button(action: {}, label: {
                    Label("Look Up", systemImage: "doc.text.magnifyingglass")
                })
                
                Button(action: {}, label: {
                    Label("Translate", systemImage: "text.bubble")
                })
                
                Button(action: {}, label: {
                    Label("Share", systemImage: "square.and.arrow.up")
                })
                
            } label: {
                Text("Menu 2")
            }

            ControlGroup {
                Button(action: {}) {
                    Label("Decrease", systemImage: "minus")
                }
                
                Button(action: {}) {
                    Label("Increase", systemImage: "plus")
                }
            }
            
            ControlGroup {
                Button(action: {}) {
                    Label("Decrease", systemImage: "minus")
                }
                
                Button(action: {}) {
                    Label("Increase", systemImage: "plus")
                }
            }
            .controlGroupStyle(.navigation)
        }
    }
}

#Preview {
    ControlGroupExample()
}
