//
//  CardView.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/14/24.
//

import SwiftUI

struct Card {
    var prompt: String
    var answer: String

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}

struct CardView: View {
    let card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .shadow(radius: 10)

            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                    .padding(.bottom)

                Text(card.answer)
                    .font(.title)
                    .foregroundStyle(.secondary)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
//        .frame(height: 250)
//        .frame(width: 450, height: 250)
    }
}

#Preview {
    CardView(card: Card.example)
        .padding()
}
