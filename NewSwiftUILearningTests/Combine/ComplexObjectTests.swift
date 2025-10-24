//
//  ComplexObjectTests.swift
//  CombineTestingsTests
//
//  Created by John Endres on 10/24/25.
//

import Testing
import Combine
@testable import NewSwiftUILearning

struct ComplexObjectTests {

    @Test func initialStateTest() async throws {
        let subject = ComplexObject()
        var iterator = subject.$isLoading.values.makeAsyncIterator()
        let value = await iterator.next()

        try #require(value != nil)
        #expect(value == false)
    }

    @MainActor
    @Test(.timeLimit(.minutes(1)))
    func loadingSequenceTest() async throws {
        let subject = ComplexObject()

        // Create an iterator over the isLoading changes
        var iterator = subject.$isLoading.values.makeAsyncIterator()

        // Expect initial emission from init task to be false
        let initial = await iterator.next()
        
        try #require(initial != nil)
        #expect(initial == false, "Initial isLoading should be false")

        // Start the function which should set isLoading to true, then back to false
        let task = Task { @MainActor in
            try await subject.executeFunction(delay: 0.2)
        }
        
        // Next value should be true (loading started)
        let started = await iterator.next()
        
        try #require(started != nil)
        #expect(started == true, "isLoading should become true when executeFunction starts")

        // Next value should be false (loading finished)
        let finished = await iterator.next()
        
        try #require(finished != nil)
        #expect(finished == false, "isLoading should become false when executeFunction completes")

        // wait for the operation to finish at the end
        _ = try await task.value
    }
}

