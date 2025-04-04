//
//  AsyncAlgorithmExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/4/25.
//

import SwiftUI
import AsyncAlgorithms

/// Look at Async Algorithms
///
/// Stopped looking after a while.  The examples and use are pretty clear.
///
/// - SeeAlso: [swift-async-algorithms](https://github.com/apple/swift-async-algorithms/tree/main)
struct AsyncAlgorithmExample: View {
    // Create an asynchronous sequence composed from a synchronous sequence
    let arrayOne = ["one", "two", "three"].async
    
    // Create an asynchronous sequence composed from a synchronous sequence
    let arrayTwo = ["Alfa", "Bravo", "Charlie", "Delta", "Echo"].async
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .task {
            await creatingExample()
            await combineLatestExample()
            await performanceOptimizationExample()
        }
    }
    
    /// Combining asynchronous sequences Example
    ///
    /// Uses hard coded arrays and prints out combination, but it is not
    /// working like I expect.  i.e., it is not going over all values.
    func combineLatestExample() async {
        print("--- chain ---")
        
        // iterates over the two given asynchronous sequences, one followed by the other
        let lines = chain(arrayOne, arrayTwo)

        for await line in lines {
            print(line)
        }

        print("--- combineLatest ---")
        
        // combines the latest values from two AsyncSequence types by emitting a tuple of the values
        for await (one, two) in combineLatest(arrayOne, arrayTwo) {
            print("One: \(one) Two: \(two)")
        }

        print("--- merge ---")
        
        // Merges two or more asynchronous sequences sharing the same element type into one singular asynchronous sequence.
        // The elements can be interspersed.
        for await element in merge(arrayOne, arrayTwo) {
            print(element)
        }

        print("--- zip ---")

        for await (apple, nasdaq) in zip(arrayOne, arrayTwo) {
          print("APPL: \(apple) NASDAQ: \(nasdaq)")
        }

        print("--- joined ---")
        
        // Concatenates an asynchronous sequence of asynchronous sequences that share
        // an Element type together sequentially where the elements from the resulting
        // asynchronous sequence are comprised in order from the elements of the first
        // asynchronous sequence and then the second (and so on) or until an error occurs.
        // Similar to chain(), except the number of asynchronous sequences to concatenate
        // is not known up front.
        let bothArrays = [arrayOne, arrayTwo].async
        let joinedWithSeparator = bothArrays.joined(separator: ["===================="].async)
        // or: let joinedWithSeparator = bothArrays.joined()

        for await lineOrSeparator in joinedWithSeparator {
            print(lineOrSeparator)
        }
    }
    
    /// Shows an array that is turned into an async sequence
    func creatingExample() async {
        print("--- creatingExample ---")
        
        // Create an asynchronous sequence composed from a synchronous sequence
        // Read each line of the data as it becomes available.
        for await line in arrayTwo {
            print(line)
        }
        
        print("--- channel ---")
        
        // Figure this one out.
    }
    
    func performanceOptimizationExample() async {
        print("--- AsyncBufferedByteIterator ---")
        
        // Figure this one out.
    }
}

#Preview {
    AsyncAlgorithmExample()
}
