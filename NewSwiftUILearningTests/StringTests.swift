//
//  StringTests.swift
//  NewSwiftUILearningTests
//
//  Created by John Endres on 8/8/24.
//

import Testing

// typed extension and had an extension of String suggesten
// type var capital and the entire property was generated
private extension String {
    var capitalizeFirstLetter: String {
        return prefix(1).capitalized + dropFirst()
    }
}

struct StringTests {

    @Test func asciiCapitalize() async throws {
        // Type "hello".ca and generated the rest
        #expect("hello".capitalizeFirstLetter == "Hello")
    }
    
    // Typed ideas for the test name and suggested others
    @Test func doubleConsonants() async throws {
        #expect("thunder".capitalizeFirstLetter == "Thunder")
    }
    
    @Test func nonASCIICapitalize() async throws {
        #expect("سلام".capitalizeFirstLetter == "سلام")
    }

}
