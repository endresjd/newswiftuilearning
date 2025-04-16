//
//  TriggerPatternExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/16/25.
//

import SwiftUI

struct TriggerPatternExample: View {
    /// Value tracked to play the sound, I hope.
    @State private var trigger = false
    
    var body: some View {
        Button("Play") {
            trigger.toggle()
        }
        .playSound(
            Bundle.main.url(forResource: "Beep", withExtension: "wav")!,
            trigger: trigger
        )
    }
}

#Preview {
    TriggerPatternExample()
}
