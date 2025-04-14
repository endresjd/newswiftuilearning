//
//  AsyncStreamsObservable.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 4/14/25.
//

import SwiftUI
import AsyncAlgorithms

/// Listen for change using AsyncStream
///
/// - SeeAlso: [How to listen for property changes in an @Observable class using AsyncStreams](https://www.polpiella.dev/observable-property-changes)
/// - Important: This seems like a non-viable solution that cannot be easily be made to work with Swift 6, at least in a safe manner.  Probably needs to be deleted.
struct AsyncStreamsObservable: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.text)
            
            TextField("Type something", text: $viewModel.text)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        .task {
            // Tasks the view model does need to happen from here in a
            // structured way so that they stay on the MainActor.  With this,
            // the task will be cancelled when the view goes away
            //
            // Update: There appears to be no obvious way around Swift 6 errors between
            // having a Sendable model with mutable content.
            // Also this appears to only work one time.
            await viewModel.startListening()
        }
    }
}

/// Data model for the view
///
/// Used to illustrate how to use AsyncStream to watch, listen, and react to
/// changes to an observed property.  This allows us finer control over the data
/// coming in by using things like debounce, etc.  These more complex methods
/// require AsyncAlgorithms as a source.
///
/// This is not what I thought it was going to be.  The code in the article is flagged
/// with concurrency warnings/errors about capturing self in a Sendable closure.
/// The solution was to make the model a final Sendable
///
/// - Important: Doesn't seem to shutdown when relying on init and deinit.  The deinit is not called when task is active?
@Observable final class ViewModel: Sendable {
    /// The stream and access to its continuation
    ///
    /// A tuple containing the stream and its continuation. The continuation should be passed to
    /// the producer while the stream should be passed to the consumer.
    private let (textStream, continuation) = AsyncStream.makeStream(of: String.self)
    
    var text = "" {
        willSet {
            // Publish a new value to the stream.
            continuation.yield(newValue)
        }
    }
    
    /// Listens to changes to the text field.
    ///
    /// This has to be done this way instead of an embedded Task to make sure that the
    /// work stays on the main actor, and that the view can start this operation in
    /// the .task modifier so that it can be cancelled when the view goes out of scope.
    /// i.e., it needs to be structured and it needs to be on the main actor.
    ///
    /// See: https://www.hackingwithswift.com/quick-start/concurrency/important-do-not-use-an-actor-for-your-swiftui-data-models
    /// for more information.
    func startListening() async {
        // Read and react to values published to the stream
        //
        // removeDuplicates: Creates an asynchronous sequence that omits repeated elements
        // debounce: Creates an asynchronous sequence that emits the latest element after a given quiescence
        // period has elapsed
        //
        // Note: even if self is captured weakly, this task, as written, prevents the
        // instance from deinit-ing.  Had to require the view to get involved in the
        // life cycle of this model.
        print("Started waiting")
        
        for await text in textStream
            .filter({ !$0.isEmpty })
            .removeDuplicates()
            .debounce(for: .seconds(0.5)) {
            print("✅ Text changed to: \(text)")
        }
        
        print("Ended waiting")
    }
    
    init() {
        print("init called")
    }
    
    deinit {
        // Close down the stream when we are done
        continuation.finish()
        
        print("deinit called")
    }
}

#Preview {
    AsyncStreamsObservable()
}
