//
//  GridViewExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/13/23.
//

import SwiftUI

// A Grid view arranges child views in rows and columns. This table-like
// structure makes a layout that is hard to do in vertical and horizontal
// stacks become easier
//
// The big different between Grid and HStack/VStack is that each cell/column
// of HStack isn't related to other rows
//
// The grid sets the width of all the cells in a column to match the needs 
// of the column's widest cell.
// The gird sets the height of the entire row to match the tallest cell in
// that particular row.

struct ColorSquare: View {
    let color: Color
    
    var body: some View {
        color
        .frame(width: 50, height: 50)
    }
}

struct SmallColorSquare: View {
    let color: Color
    
    var body: some View {
        color
        .frame(width: 10, height: 10)
    }
}

struct GridViewExample: View {
    var body: some View {
        List {
            Grid() {
                // Each view in a GridRow represents a column.
                //
                // The grid adds empty cells to the trailing edge of rows that
                // have fewer columns
                GridRow {
                    Text("Row 1, Column 1")
                    Text("R 1, C 2")
                    // Color.pink
                }
                
                // To prevent a flexible view from taking more space than the
                // other cells, add the gridCellUnsizedAxes(_:) view modifier
                // to the view.  Without it the grid will fill the view
                // horizontally.
                Divider()
                    .gridCellUnsizedAxes(.horizontal)
                
                GridRow {
                    Text("R 2, C 1")
                    Text("Row 2, Column 2")
                    // Color.yellow
                }
            }
            .border(Color.red)
            
            Grid {
                GridRow {
                    // This insert empty cells at the start
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                    
                    ForEach(0..<3) { _ in
                        ColorSquare(color: .pink)
                    }
                }
                
                GridRow {
                    // To make a cell span columns.  Seems strange because
                    // it is no longer aligned.
                    ColorSquare(color: .yellow)
                    //                    .gridCellColumns(2)
                    
                    ColorSquare(color: .yellow)
                }
                
                GridRow {
                    ForEach(0..<5) { _ in
                        ColorSquare(color: .mint)
                    }
                }
            }
            
            // We can control the spacing between cells in both the horizontal
            // and vertical dimensions and set a default alignment for the
            // content in all the grid cells when you initialize the grid using
            // the init(alignment:horizontalSpacing:verticalSpacing:content:)
            // initializer.
            Grid(alignment: .topLeading, horizontalSpacing: 1, verticalSpacing: 15) {
                GridRow {
                    ForEach(0..<5) { _ in
                        ColorSquare(color: .pink)
                    }
                }
                GridRow {
                    SmallColorSquare(color: .yellow)
                    ForEach(0..<4) { _ in
                        ColorSquare(color: .yellow)
                    }
                }
                GridRow {
                    SmallColorSquare(color: .mint)
                    ForEach(0..<4) { _ in
                        ColorSquare(color: .mint)
                    }
                }
                GridRow {
                    SmallColorSquare(color: .purple)
                    ForEach(0..<4) { _ in
                        ColorSquare(color: .purple)
                    }
                }
            }
            
            // To override the default horizontal alignment for specific grid column,
            // you use gridColumnAlignment view modifier on any view of that
            // particular column.
            Grid(alignment: .topLeading, horizontalSpacing: 1, verticalSpacing: 15) {
                GridRow {
                    ForEach(0..<5) { _ in
                        ColorSquare(color: .pink)
                    }
                }
                GridRow {
                    SmallColorSquare(color: .yellow)
                        .gridColumnAlignment(.center)   // For all first column cells

                    SmallColorSquare(color: .yellow)
                    SmallColorSquare(color: .yellow)
                    SmallColorSquare(color: .yellow)
                    ColorSquare(color: .yellow)
                }
                GridRow {
                    SmallColorSquare(color: .mint)
                    SmallColorSquare(color: .mint)
                        .gridColumnAlignment(.trailing)

                    SmallColorSquare(color: .mint)
                    SmallColorSquare(color: .mint)
                    ColorSquare(color: .mint)
                    
                }
                GridRow {
                    SmallColorSquare(color: .purple)
                    SmallColorSquare(color: .purple)
                    SmallColorSquare(color: .purple)
                    SmallColorSquare(color: .purple)
                    ColorSquare(color: .purple)
                    
                }
            }

            Grid(alignment: .topLeading,

                 horizontalSpacing: 1,
                 verticalSpacing: 30) {
                GridRow {
                    ForEach(0..<5) { _ in
                        ColorSquare(color: .pink)
                    }
                }
                GridRow(alignment: .bottom) {

                    SmallColorSquare(color: .yellow)
                    SmallColorSquare(color: .yellow)
                    SmallColorSquare(color: .yellow)
                    SmallColorSquare(color: .yellow)
                    ColorSquare(color: .yellow)
                }
                GridRow(alignment: .center) {

                    SmallColorSquare(color: .mint)
                    SmallColorSquare(color: .mint)
                    SmallColorSquare(color: .mint)
                    SmallColorSquare(color: .mint)
                    ColorSquare(color: .mint)
                    
                }
                GridRow {
                    SmallColorSquare(color: .purple)
                    SmallColorSquare(color: .purple)
                    SmallColorSquare(color: .purple)
                    SmallColorSquare(color: .purple)
                    ColorSquare(color: .purple)
                    
                }
            }

            // You can override both vertical and horizontal alignment
            // of a specific cell with the gridCellAnchor(_:) view modifier
            Grid(alignment: .topLeading, horizontalSpacing: 1, verticalSpacing: 15) {
                GridRow {
                    ForEach(0..<5) { _ in
                        ColorSquare(color: .pink)
                    }
                }
                GridRow(alignment: .bottom) {
                    SmallColorSquare(color: .yellow)
                        .gridColumnAlignment(.center)
                    SmallColorSquare(color: .yellow)
                    SmallColorSquare(color: .yellow)
                    SmallColorSquare(color: .yellow)
                    ColorSquare(color: .yellow)
                }
                GridRow(alignment: .center) {
                    SmallColorSquare(color: .mint)
                    SmallColorSquare(color: .mint)
                        .gridColumnAlignment(.trailing)
                    SmallColorSquare(color: .mint)
                    SmallColorSquare(color: .mint)
                    ColorSquare(color: .mint)
                    
                }
                GridRow {
                    SmallColorSquare(color: .purple)
                        .gridCellAnchor(.bottomTrailing)
                    
                    SmallColorSquare(color: .purple)
                        .gridCellAnchor(.bottomLeading)
                    
                    SmallColorSquare(color: .purple)
                    SmallColorSquare(color: .purple)
                    ColorSquare(color: .purple)
                    
                }
            }
        }
    }
}

#Preview {
    GridViewExample()
}
