//
//  FakeAsyncService.swift
//  TaskModifierDemo
//
//  Created by Gabriel Theodoropoulos.
//  https://serialcoder.dev
//

import Foundation

class FakeAsyncService {
    static func fetchProfile(withID id: Int) async throws -> TaskProfile {
        try await Task.sleep(for: .seconds(1))
        
        if let profile = TaskProfile.all.first(where: { $0.id == id }) {
            if id == -1 {
                // Throw a fake error when the Profile with id
                // equal to -1 is requested.
                throw URLError(.badServerResponse)
            }
            
            return profile
            
        } else {
            // Throw another fake error if a Profile with
            // a non-existing id is requested.
            throw URLError(.fileDoesNotExist)
        }
    }
}
