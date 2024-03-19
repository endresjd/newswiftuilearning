//
//  FormExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// iOS 13's Form with sections for an example settings view
///
/// A container for grouping controls used for data entry, such as in settings or inspectors.
///
/// SwiftUI applies platform-appropriate styling to views contained inside a form, to group them together. Form-specific
/// styling applies to things like buttons, toggles, labels, lists, and more. Keep in mind that these stylings may be platform-specific.
/// For example, forms apppear as grouped lists on iOS, and as aligned vertical stacks on macOS.
struct FormExample: View {
    enum NotifyMeAboutType {
        case directMessages
        case mentions
        case anything
    }
    
    enum ProfileImageSize {
        case large
        case medium
        case small
    }
    
    @State private var notifyMeAbout = NotifyMeAboutType.anything
    @State private var profileImageSize = ProfileImageSize.medium
    @State private var playNotificationSounds = true
    @State private var sendReadReceipts = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Notifications")) {
                    Picker("Notify Me About", selection: $notifyMeAbout) {
                        Text("Direct Messages").tag(NotifyMeAboutType.directMessages)
                        Text("Mentions").tag(NotifyMeAboutType.mentions)
                        Text("Anything").tag(NotifyMeAboutType.anything)
                    }
                    
                    Toggle("Play notification sounds", isOn: $playNotificationSounds)
                    Toggle("Send read receipts", isOn: $sendReadReceipts)
                }
                Section(header: Text("User Profiles")) {
                    Picker("Profile Image Size", selection: $profileImageSize) {
                        Text("Large").tag(ProfileImageSize.large)
                        Text("Medium").tag(ProfileImageSize.medium)
                        Text("Small").tag(ProfileImageSize.small)
                    }
                    
                    Button("Clear Image Cache") {                        
                    }
                }
            }
        }
    }
}

#Preview {
    FormExample()
}
