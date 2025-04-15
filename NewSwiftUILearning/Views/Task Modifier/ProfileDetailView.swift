//
//  ProfileDetailView.swift
//  TaskModifierDemo
//
//  Created by Gabriel Theodoropoulos.
//  https://serialcoder.dev
//

import SwiftUI

struct ProfileDetailView: View {
    let profileID: Int
    @State private var profile: TaskProfile?
    @State private var error: String?
    
    var body: some View {
        VStack(spacing: 20) {
            if let profile {
                // Show profile details.
                Text(profile.name)
                    .font(.title)
                
                Text(profile.country)
                
                Text(profile.email).foregroundColor(.blue)
            } else if let error {
                // In real apps handle the error properly!
                Text("Error: \(error)").foregroundColor(.red)
            } else {
                // Show a progress while fetching async data.
                ProgressView("Fetching profile...")
            }
        }
        .padding()
        .navigationTitle("Profile Details")
        
        // MARK: - Single task
//        .task {
//            profile = try? await FakeAsyncService.fetchProfile(withID: 1)
//        }
        
        // MARK: - task with id
//        .task(id: profileID) {
//            profile = try? await FakeAsyncService.fetchProfile(withID: profileID)
//        }
        
        // MARK: - task with basic error handling
//        .task(id: profileID) {
//            do {
//                profile = try await FakeAsyncService.fetchProfile(
//                    withID: profileID
//                )
//                
//                // Ensure error property is nil.
//                error = nil
//            } catch {
//                self.error = error.localizedDescription
//                
//                // Ensure profile is nil as there is an error.
//                profile = nil
//            }
//        }
        
        // MARK: - Setting a custom task priority
//        .task(priority: .background) {
//            profile = try? await FakeAsyncService.fetchProfile(withID: 1)
//        }
        
        // MARK: - task with id and priority
//        .task(id: profileID, priority: .background) {
//            profile = try? await FakeAsyncService.fetchProfile(withID: profileID)
//        }
        
        // MARK: - Test task cancellation
        .task(id: profileID) {
            do {
                print("Will fetch profile with id: \(profileID)")
                
                // Delay profile fetching for 3 seconds so there's
                // time to navigate to the previous view. Doing so
                // simulates a long-running task.
                try await Task.sleep(for: .seconds(1))
                
                // This code will be executed after 3 seconds and if
                // we don't navigate to the previous view.
                profile = try await FakeAsyncService.fetchProfile(withID: profileID)
                error = nil
            } catch is CancellationError {
                // This message will be printed if we go to
                // the previous view while task is running.
                print("Task was cancelled!")
            } catch {
                profile = nil
                self.error = error.localizedDescription
            }
        }
    }
}

#Preview {
    ProfileDetailView(profileID: 1)
}
