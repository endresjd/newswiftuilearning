//
//  ControlExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/11/24.
//

import AppIntents
import SwiftUI
import WidgetKit

struct ControlExample: View {
    var body: some View {
        Text("See: Access you app's controls across the system.")
        Text("Just declaring these isn't enough, obviously")
    }
}

// MARK: Apple Code

@available(iOS 18.0, *)
struct StartPartyControl: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.macplugins.NewSwiftUILearning.karaoke_start_party"
        ) {
            ControlWidgetButton(action: StartPartyIntent()) {
                Label("Start the Party!", systemImage: "music.mic")
                Text(PartyManager.shared.nextParty.name)
            }
        }
    }
}

// Model code

class PartyManager {
    @MainActor static let shared = PartyManager()
    var nextParty = Party(name: "WWDC Karaoke")
}

// AppIntent

struct StartPartyIntent: AppIntent {
    static let title: LocalizedStringResource = "Start the Party"

    func perform() async throws -> some IntentResult {
        .result()
    }
}

#Preview {
    ControlExample()
}
