//
//  Profile.swift
//  TaskModifierDemo
//
//  Created by Gabriel Theodoropoulos.
//  https://serialcoder.dev
//

import Foundation

struct TaskProfile: Identifiable, Hashable {
    let id: Int
    let name: String
    let country: String
    let email: String
    
    // Randomly generated names and email addresses.
    static let all: [TaskProfile] = [
        TaskProfile(id: 1, name: "Sofia Kim",
                country: "South Korea", email: "sofia.kim@example.com"),
        TaskProfile(id: 2, name: "Liam O'Reilly",
                country: "Ireland", email: "liam.oreilly@example.com"),
        TaskProfile(id: 3, name: "Nina Patel",
                country: "India", email: "nina.patel@example.com"),
        TaskProfile(id: 4, name: "Jasper Wang",
                country: "Singapore", email: "jasper.wang@example.com"),
        TaskProfile(id: -1, name: "Simulated Failure",
                country: "Unknown", email: "fail@example.com")
    ]
}
