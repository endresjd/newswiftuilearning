//
//  PresentationDetentsExample.swift
//  NewSwiftUILearning
//
//  Created by Endres, John on 3/7/24.
//

import SwiftUI

/// Examples of presentation modifiers for sheets.
///
/// SwiftUI’s presentationDetents() modifier lets us create sheets that slide up from the bottom of our view,
/// but occupy only part of the screen – how much is down to us, and we have as much or as little control
/// as we want.
///
/// This seems to not really work in landscape.  Need to figure out how to close the sheet then.
///
/// - Warning: Using these, and this may be sheets in general, gives no way to drag the sheet closed when in landscape/compact mode
/// - Important: iOS 16 minimum
/// - SeeAlso: [How to display a bottom sheet](https://www.hackingwithswift.com/quick-start/swiftui/how-to-display-a-bottom-sheet)
struct PresentationExample: View {
    @State private var showingCredits = false
    @State private var showFractional = false
    @State private var showExact = false
    @State private var showPercentages = false
    @State private var showDragIndicator = true
    
    private let heights = stride(from: 0.1, through: 1.0, by: 0.1).map { PresentationDetent.fraction($0) }

    var body: some View {
        Toggle("Show drag indicator", isOn: $showDragIndicator)
            .padding(.horizontal)
            .padding(.bottom)
        
        Button("Show Credits") {
            showingCredits.toggle()
        }
        .sheet(isPresented: $showingCredits) {
            Text("This app was brought to you by Hacking with Swift")
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(showDragIndicator ? .visible : .hidden)
        }
        
        Button("Show fractional") {
            showFractional.toggle()
        }
        .sheet(isPresented: $showFractional) {
            Text("Showing a fractional detent")
                .presentationDetents([.fraction(0.15)])
                .presentationDragIndicator(showDragIndicator ? .visible : .hidden)
        }
        
        Button("Show exact") {
            showExact.toggle()
        }
        .sheet(isPresented: $showExact) {
            Text("Showing an exact detent")
                .presentationDetents([.height(300)])
                .presentationDragIndicator(showDragIndicator ? .visible : .hidden)
        }
        
        Button("Show percentages") {
            showPercentages.toggle()
        }
        .sheet(isPresented: $showPercentages) {
            Text("Showing 10% intervals")
                .presentationDetents(Set(heights))
                .presentationDragIndicator(showDragIndicator ? .visible : .hidden)
        }
    }
}

#Preview {
    PresentationExample()
}
