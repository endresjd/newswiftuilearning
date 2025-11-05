//
//  ControlGroupExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Shows different uses of iOS 15's ControlGroup, including the fancy popup menus.
///
/// The ControlGroup view displays semantically-related controls in a visually appropriate manner for the context.
/// The display of the group depends on the environment, and it will match the correct way.  This can be
/// seen with `.compactMenu` and `.navigation`
///
/// - SeeAlso: [ControlGroup](https://swiftwithmajid.com/2021/10/21/mastering-controlgroup-in-swiftui/)
struct ControlGroupExample: View {
    var body: some View {
        VStack(spacing: 50) {
            Menu {
                ControlGroup {
                    Button {
                    } label: {
                        Image(systemName: "scissors")
                    }

                    Button {
                    } label: {
                        Image(systemName: "scissors")
                    }

                    Button {
                    } label: {
                        Image(systemName: "doc.on.doc")
                    }

                    Button {
                    } label: {
                        Image(systemName: "doc.on.clipboard")
                    }

                    Button {
                    } label: {
                        Image(systemName: "doc.text.magnifyingglass")
                    }
                }
                .controlGroupStyle(.compactMenu)

                Button(
                    action: {},
                    label: {
                        Label("Translate", systemImage: "trash")
                    })

                Button(
                    action: {},
                    label: {
                        Label("share", systemImage: "square.and.arrow.up")
                    })
            } label: {
                Text("Menu 1")
            }

            Menu {
                ControlGroup {
                    Button {
                    } label: {
                        Label("Cut", systemImage: "scissors")
                    }

                    Button {
                    } label: {
                        Label("Copy", systemImage: "doc.on.doc")
                    }

                    Button(
                        action: {},
                        label: {
                            Label("Paste", systemImage: "doc.on.clipboard")
                        })
                }
                .controlGroupStyle(.menu)

                Button {
                } label: {
                    Label("Look Up", systemImage: "doc.text.magnifyingglass")
                }

                Button {
                } label: {
                    Label("Translate", systemImage: "text.bubble")
                }

                Button {
                } label: {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
            } label: {
                Text("Menu 2")
            }

            ControlGroup {
                Button {
                } label: {
                    Label("Decrease", systemImage: "minus")
                }

                Button {
                } label: {
                    Label("Increase", systemImage: "plus")
                }
            }

            ControlGroup {
                Button {
                } label: {
                    Label("Decrease", systemImage: "minus")
                }

                Button {
                } label: {
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
