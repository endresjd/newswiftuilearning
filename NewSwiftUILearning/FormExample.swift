//
//  FormExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

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
                    
                    Button("Clear Image Cache") {}
                }
            }
        }
    }
}

#Preview {
    FormExample()
}
