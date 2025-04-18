//
//  TabView18Example.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/11/24.
//

import SwiftUI
import Charts

@available(iOS 18.0, *)
struct TabView18Example: View {
    @State private var customization = TabViewCustomization()
    
    var body: some View {
        TabView {
            Tab("Parties", systemImage: "party.popper") {
                PartiesView(parties: Party.all)
            }
            .customizationID("karaoke.tab.parties")
            
            Tab("Planning", systemImage: "pencil.and.list.clipboard") {
                PlanningView()
            }
            .customizationID("karaoke.tab.planning")
            
            TabSection("John") {
                Tab("Attendance", systemImage: "person.3") {
                    AttendanceView()
                }
                .customizationID("karaoke.tab.attendance")
                
                Tab("Song List", systemImage: "music.note.list") {
                    SongListView()
                }
                .customizationID("karaoke.tab.songlist")
            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($customization)
    }
}

struct PartiesView: View {
    var parties: [Party]
    var body: some View {
        Text("PartiesView")
    }
}

struct PlanningView: View {
    var body: some View {
        Text("PlanningView")
    }
}

struct AttendanceView: View {
    var body: some View {
        if #available(iOS 18, *) {
            Chart {
                LinePlot(x: "Parties", y: "Guests") { x in
                    pow(x, 2)
                }
                .foregroundStyle(.purple)
            }
            .chartXScale(domain: 1...10)
            .chartYScale(domain: 1...100)
        } else {
            FutureFeatureView()
        }
    }
}

struct SongListView: View {
    var body: some View {
        Text("SongListView")
    }
}

struct Party {
    var name: String
    var id = UUID()
    
    // TODO: what if I want this mutable?  If it is var (not let) then this will be a concurrency error in Swift 6
    static let all: [Party] = []
}

#Preview {
    if #available(iOS 18, *) {
        TabView18Example()
    }
}
