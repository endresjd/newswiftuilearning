//
//  TransformedShapeExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/21/23.
//

import SwiftUI

struct TransformedShapeExample: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("I think this is a result of a shape that has been transformed?")
                .multilineTextAlignment(.center)
            Text("Not sure.  No examples.  These here are wrong.")
                .padding(.bottom, 50)
            
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(.blue)
                .rotationEffect(.degrees(22))
                .transformEffect(.identity)
            
            Button("Text") {
                let hurm = Rectangle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.blue)
                    .rotationEffect(.degrees(22))
                    .transformEffect(.identity)
                
                print(type(of: hurm))
            }
            .padding(.top, 50)
        }
    }
}

#Preview {
    TransformedShapeExample()
}
