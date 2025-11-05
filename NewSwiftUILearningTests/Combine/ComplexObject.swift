//
//  ComplexObject.swift
//  CombineTestingsTests
//
//  Created by John Endres on 10/24/25.
//

import Combine
import Foundation

class ComplexObject: ObservableObject {
    @Published var isLoading = false

    var cancellable: Set<AnyCancellable> = []

    /// Integer publisher.
    ///
    /// Publishes each element of the array individually (Int) rather than the whole array.
    /// Elements are delayed by 1 second from their original emission.
    let elementPublisher1 = Just([1, 2, 3, 4, 5])
        .flatMap { array in
            array.publisher
        }
        .delay(for: .seconds(1), scheduler: DispatchQueue.main)

    /// Example consumer showing how to subscribe to the elementPublisher.
    func consumeElements() {
        elementPublisher1
            .sink { [weak self] value in
                // handle each element: 1, 2, 3, 4, 5 (each delayed by 1 second)
                print("element: \(value)")
                self?.isLoading = (value != 5)
            }
            .store(in: &cancellable)
    }

    func executeFunction(delay: Double = 1.0) async throws {
        defer {
            isLoading = false
        }

        isLoading = true

        try await Task.sleep(for: .seconds(delay))
    }

    init() {
    }
}
