//
//  CombineTestingsTests.swift
//  CombineTestingsTests
//
//  Created by John Endres on 10/24/25.
//

import Combine
import Foundation
import Testing

@testable import NewSwiftUILearning

struct NewSwiftUILearning {
    /// Async iterator test.
    ///
    /// Turns a Combine publisher into an async iterator.  The publisher publishes a value after delaying
    /// for a second using the runloop as the scheduler.
    @Test func runloopDelayTest() async throws {
        let start = Date()
        let delayedPublisher = Just(42).delay(for: .seconds(1), scheduler: RunLoop.main)
        var iterator = delayedPublisher.values.makeAsyncIterator()
        let value = await iterator.next()
        let elapsed = Date().timeIntervalSince(start)

        try #require(value == 42)
        #expect(elapsed >= 1, "Delay should be at least 1 second, got \(elapsed)")
    }

    /// Alternate way to monitor and delay.
    ///
    /// Uses `confirmation` to confirm that some event occurs during the invocation of a function
    /// and delays using `Task.sleep`.  Not sure what the sleep does other than illustrate what
    /// can be done.
    @Test func confirmationUnderstandTest() async throws {
        let publisher = Just<Int?>(1).delay(for: .seconds(1), scheduler: RunLoop.main)

        // Use confirmations to check that an event occurs while a test is running in complex
        // scenarios where #expect() and #require() are insufficient. For example, a
        // confirmation may be useful when an expected event occurs such as the publisher
        // sink call here.
        //
        // It is important to note that this function does not wait for the confirmation to finish.
        // It is just a complex #expect.  If the publisher takes more than 2 seconds, this will fail.
        // The confirmation has to finish within the context of the closure.
        //
        // This is a single step in the test.
        try await confirmation { confirmation in
            var cancellable: Set<AnyCancellable> = []

            publisher.sink { value in
                #expect(value != nil)
                confirmation()
            }
            .store(in: &cancellable)

            // This gives the closure a chance to have the publisher's sink function to
            // be called.  Without this, and because of the publisher delay, this test block
            // will fail because `confirmation()` wasn't called.
            try await Task.sleep(for: .seconds(2))
        }
    }

    /// Delays for 10 seconds using RunLoop directly (no Combine).
    @Test func runloopDirectDelay10Seconds() async throws {
        let interval = 3.0
        let start = Date()

        //        try await Task.sleep(for: .seconds(interval))

        await runLoopDelayWithCombine(for: interval)
        // runloopDelay()

        let elapsed = Date().timeIntervalSince(start)

        #expect(elapsed >= interval, "Elapsed time should be at least 3 seconds, got \(elapsed)")
    }

    func runLoopDelayWithCombine(for seconds: Double = 1) async {
        let delayedPublisher = Just(42).delay(for: .seconds(seconds), scheduler: RunLoop.main)
        var iterator = delayedPublisher.values.makeAsyncIterator()

        _ = await iterator.next()
    }

    func runloopDelay() {
        // Runs the loop until the specified date, during which time it processes data
        // from all attached input sources
        RunLoop.current.run(until: Date().addingTimeInterval(3))
    }

    @Test func complextObjectTests() async throws {
        let subject = ComplexObject()

        subject.consumeElements()

        try await Task.sleep(for: .seconds(10))
    }
}
