//
//  ButtonRoleExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 9/3/25.
//

import SwiftUI

@available(iOS 26.0, *)
struct ButtonRoleExample: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("Show sheet") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            MySheetView()
        }
    }
}

@available(iOS 26.0, *)
private struct MySheetView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Text("This is a modal sheet.")
                .navigationTitle("Sheet Title")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Close", systemImage: "xmark", role: .close) {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Destructive", systemImage: "xmark", role: .destructive) {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .automatic) {
                        Button("Dismiss", systemImage: "checkmark", role: .confirm) {
                            dismiss()
                        }
                    }
                }
        }
    }
}

@available(iOS 26.0, *)
#Preview {
    ButtonRoleExample()
}
