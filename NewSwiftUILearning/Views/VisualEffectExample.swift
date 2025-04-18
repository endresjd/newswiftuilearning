//
//  VisualEffectExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/17/25.
//

import SwiftUI

/// Look at the visualEffect modifer
///
/// This modifier applies effects to the view, while providing access to layout information through a geometry proxy.
/// The visual effect is anything that can change the visual appearance of the view but doesn’t affect its layout.
/// The only difference of the new approach is the way we scope the visual effects of the view by calculating them
/// from the layout information that GeometryProxy provides us.
///
/// - SeeAlso: [Visual effects in SwiftUI](https://swiftwithmajid.com/2023/11/07/visual-effects-in-swiftui)
/// - Important: Tried to animated some, but referencing properties in the modifier give:
///         `Main actor-isolated property 'animated' can not be referenced from a Sendable closure; this is an error in the Swift 6 language mode`
struct VisualEffectExample: View {
    /// Show the effect
    @State private var showOffsetEffect = false
    
    /// This one is a more complicated set of effects
    @State private var showMoreComplicatedEffect = false
    
    @State private var isScaled = false

    var body: some View {
        Form {
            Toggle("Show Offset Effect", isOn: $showOffsetEffect)
            Toggle("Show Complex Effect", isOn: $showMoreComplicatedEffect)
            Toggle("Animated", isOn: $isScaled)

            Text("Visual Effect")
                .if(showOffsetEffect) { view in
                    view
                        .visualEffect { content, geometryProxy in
                            content.offset(geometryProxy.size)
                        }
                        .padding(.bottom)
                }
                .if(showMoreComplicatedEffect) { view in
                    view
                        .visualEffect { initial, geometry in
                            initial
                                .blur(radius: 8)
                                .opacity(0.9)
                                .scaleEffect(.init(width: 2, height: 2))
                        }
                        .padding()
                }
            
            Text("No Visual Effect")
                .if(showOffsetEffect) { view in
                    view
                        .strikethrough()
                }
                .if(showMoreComplicatedEffect) { view in
                    view
                        .blur(radius: 8)
                        .opacity(0.9)
                        .scaleEffect(.init(width: 2, height: 2))
                        .padding()
                }
                .if(showMoreComplicatedEffect) { view in
                    view
                }
            
            HStack {
                Spacer()
                
                // Swift 6 warning/error: Main actor-isolated property 'isScaled' can not be referenced from a Sendable closure; this is an error in the Swift 6 language mode
                // Solution is to capture that variable in the closure [isScaled].
                //
                // See: https://stackoverflow.com/questions/79148855/how-to-use-an-state-property-from-a-sendable-closure-in-swiftui
                Text("Animated")
                    .visualEffect { [isScaled] initial, geometry in
                        initial.scaleEffect(
                            CGSize(
                                width: isScaled ? 2 : 1,
                                height: isScaled ? 2 : 1
                            )
                        )
                    }
                    .animation(.smooth, value: isScaled)
                
                Spacer()
            }

        }
    }
}

#Preview {
    VisualEffectExample()
}
