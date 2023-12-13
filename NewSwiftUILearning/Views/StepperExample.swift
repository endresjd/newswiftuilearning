//
//  StepperExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/14/23.
//

import SwiftUI

struct StepperViewOne: View {
    @State private var value = 0
    let colors: [Color] = [.orange, .red, .gray, .blue, .green, .purple, .pink]
    
    func incrementStep() {
        value += 1
        if value >= colors.count { value = 0 }
    }
    
    func decrementStep() {
        value -= 1
        if value < 0 { value = colors.count - 1 }
    }
    
    var body: some View {
        Stepper {
            Text("Value: \(value) Color: \(colors[value].description)")
        } onIncrement: {
            incrementStep()
        } onDecrement: {
            decrementStep()
        }
        .padding(5)
        .background(colors[value])
    }
}

struct StepperViewTwo: View {
    @State private var value = 0
    let step = 5
    let range = 1...50


    var body: some View {
        Stepper(value: $value,
                in: range,
                step: step) {
            Text("Current: \(value) in \(range.description) " +
                 "stepping by \(step)")
        }
            .padding(10)
    }
}

struct StepperExample: View {
    var body: some View {
        List {
            StepperViewOne()
            StepperViewTwo()
        }
    }
}

#Preview {
    StepperExample()
}
