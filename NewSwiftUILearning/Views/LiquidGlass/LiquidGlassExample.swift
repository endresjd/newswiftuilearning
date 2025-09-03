//
//  LiquidGlassExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 8/11/25.
//

import SwiftUI

@available(iOS 26.0, *)
private struct LiquidGlassExampleContents: View {
    @Namespace private var namespace
    @Namespace private var namespace2
    @State private var isExpanded = false

    private let symbolSet = ["cloud.bolt.rain.fill", "sun.rain.fill", "moon.stars.fill", "moon.fill"]

    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.title)
                .padding()
            
            // Add Liquid Glass effects to a view
            Text("Hello, World!")
                .font(.title)
                .padding()
                .glassEffect()

            // Add Liquid Glass effects to a view
            // with a shape
            Text("Hello, World!")
                .font(.title)
                .padding()
                .glassEffect(in: .rect(cornerRadius: 16.0))

            // Add Liquid Glass effects to a view
            // with a shape and tint.  Interactive
            // make them react to touch and pointer
            // interactions
            Text("Hello, World!")
                .font(.title)
                .padding()
                .glassEffect(.regular.tint(.orange).interactive())

            // Liquid Glass effects on multiple views to
            // achieve the best rendering performance.
            GlassEffectContainer(spacing: 40.0) {
                HStack(spacing: 40.0) {
                    Image(systemName: "scribble.variable")
                        .frame(width: 80.0, height: 80.0)
                        .font(.system(size: 36))
                        .glassEffect()

                    // An `offset` shows how Liquid Glass effects react to each
                    // other in a container.
                    // Use animations and components appearing and disappearing
                    // to obtain effects that look purposeful.
                    Image(systemName: "eraser.fill")
                        .frame(width: 80.0, height: 80.0)
                        .font(.system(size: 36))
                        .glassEffect()
                        .offset(x: -40.0, y: 0.0)
                }
            }

            // the geometries of multiple views to contribute to a single
            // Liquid Glass effect capsule, even when your content is at rest.
            GlassEffectContainer(spacing: 20.0) {
                HStack(spacing: 20.0) {
                    ForEach(symbolSet.indices, id: \.self) { item in
                        Image(systemName: symbolSet[item])
                            .frame(width: 80.0, height: 80.0)
                            .font(.system(size: 36))
                            .glassEffect()
                            .glassEffectUnion(id: item < 2 ? "1" : "2", namespace: namespace)
                    }
                }
            }

            // Morphing effects occur during transitions between views with
            // Liquid Glass effects.
            GlassEffectContainer(spacing: 40.0) {
                HStack(spacing: 40.0) {
                    Image(systemName: "scribble.variable")
                        .frame(width: 80.0, height: 80.0)
                        .font(.system(size: 36))
                        .glassEffect()
                        .glassEffectID("pencil", in: namespace2)

                    if isExpanded {
                        Image(systemName: "eraser.fill")
                            .frame(width: 80.0, height: 80.0)
                            .font(.system(size: 36))
                            .glassEffect()
                            .glassEffectID("eraser", in: namespace2)
                    }
                }
            }

            Button("Toggle") {
                withAnimation {
                    isExpanded.toggle()
                }
            }
            .buttonStyle(.glass)
        }
    }
}

/// Shows how to apply it directly
///
/// - SeeAlso: [Applying Liquid Glass to custom views](https://developer.apple.com/documentation/SwiftUI/Applying-Liquid-Glass-to-custom-views)
@available(iOS 26.0, *)
struct LiquidGlassExample: View {
    @ViewBuilder
    var dogImage: some View {
        Image("dog")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
    
    var body: some View {
        ZStack {
            // Color.blue.opacity(0.2)
            dogImage
                .ignoresSafeArea()
            
            ScrollView {
                LiquidGlassExampleContents()
            }
        }
    }
}

@available(iOS 26.0, *)
#Preview {
    LiquidGlassExample()
}
