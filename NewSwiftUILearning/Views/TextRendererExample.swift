//
//  TextRendererExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 3/25/25.
//

import SwiftUI

/// Attributes for hilighted text
struct HighlightAttribute: TextAttribute {
}

/// Renderer
///
/// It can be seen as a simple marker that can be attached to Text view instances. It will be read during rendering to attach certain changes to the text.
/// It does not need any real implementation, just a type that conforms to the protocol
struct HighlightTextRenderer: TextRenderer {
    private let style: any ShapeStyle
 
    init(style: any ShapeStyle = .yellow) {
        self.style = style
    }
    
    /// Draw the text
    ///
    /// Let's take a closer look at what is happening here. First, we check if the current run has our custom TextAttribute attached. If it doesn't, we simply draw
    /// the text without making any changes. If the TextAttribute is attached, we proceed to modify the rendering. We obtain the rect where the text will be
    /// drawn. Then we define the shape of the highlight. Finally, we fill the shape with the specified style and draw it onto the screen.
    ///
    /// - Parameters:
    ///   - layout: A value describing the layout and custom attributes of a tree of Text views.
    ///   - context: An immediate mode drawing destination, and its current state
    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for run in layout.flattenedRuns {
            if run[HighlightAttribute.self] != nil {
                // The rect of the current run
                let rect = run.typographicBounds.rect
     
                // Make a copy of the context so that individual slices
                // don't affect each other.
                let copy = context
     
                // Shape of the highlight, can be customised
                let shape = RoundedRectangle(cornerRadius: 4, style: .continuous).path(in: rect)
     
                // Style the shape
                copy.fill(shape, with: .style(style))
     
                // Draw
                copy.draw(run)
            } else {
                let copy = context
                copy.draw(run)
            }
        }
    }
}

extension Text.Layout {
    /// A helper function for easier access to all runs in a layout.
    ///
    /// To more efficiently access the text layouts and the individual lines, runs and run slices we add two extensions on Text.Layout
    ///
    /// - SeeAlso: [Creating Visual Effects with SwiftUI](https://developer.apple.com/documentation/SwiftUI/Creating-visual-effects-with-SwiftUI)
    var flattenedRuns: some RandomAccessCollection<Text.Layout.Run> {
        self.flatMap { line in
            line
        }
    }
}

/// Show how to hilight text
///
/// The steps are:
/// 1. Text with the custom attribute added
/// 2. A second Text that includes the first but which also has the given TextRenderer added to it
///
/// - SeeAlso: [Using TextRenderer to create highlighted text](https://alexanderweiss.dev/blog/2024-06-24-using-textrenderer-to-create-highlighted-text?utm_campaign=This%2BWeek%2Bin%2BSwift&utm_medium=email&utm_source=This_Week_in_Swift_170)
struct TextRendererExample: View {
    var body: some View {
        let highlight = Text("World")
            .customAttribute(HighlightAttribute())
        
        Text("Hello \(highlight)")
            .textRenderer(HighlightTextRenderer())
    }
}

#Preview {
    TextRendererExample()
}
