//
//  PlaySoundViewModifier.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/16/25.
//

import AVFoundation
import SwiftUI

/// Play a sound when the value of the trigger changes.
///
/// - SeeAlso: [Trigger Pattern](https://swiftwithmajid.com/2024/04/02/trigger-value-pattern-in-swiftui)
/// - Important: The modifier in that article doesn't give the audio player enough time to play the sound.
struct PlaySoundViewModifier<Trigger: Equatable>: ViewModifier {
    /// Disk-based sound.
    let sound: URL?

    /// Value to trigger the sound playing.
    let trigger: Trigger

    /// The player for the sound.
    ///
    /// If this doesn't outlive the onChange modifier, the sound will not play.
    /// Don't like storing this in @State, but making a model that supports
    /// the generic Equatable value blows up the Swift 6 stuff.  Swift 6
    /// is starting to bum me out.
    @State private var player: AVAudioPlayer?

    /// Modifies the content view to have an onChange modifier that
    /// triggers off of changes to the trigger value.
    ///
    /// - Parameter content: Content view being modified
    /// - Returns: Modified  view
    func body(content: Content) -> some View {
        content
            .onChange(of: trigger) {
                if let sound {
                    player = try? AVAudioPlayer(contentsOf: sound)

                    player?.prepareToPlay()
                    player?.play()
                }
            }
    }
}

extension View {
    /// Play the given sound when the trigger value changes.
    ///
    /// - Parameters:
    ///   - sound: location of sound, probably has to be local.  If nil, no sound will be played
    ///   - trigger: trigger for the change as defined by the the client view.
    ///
    /// - Returns: modified view with the sound modifier attached.
    func playSound(_ sound: URL?, trigger: some Equatable) -> some View {
        self.modifier(PlaySoundViewModifier(sound: sound, trigger: trigger))
    }
}
