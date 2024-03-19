//
//  ColorExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 11/11/23.
//

import SwiftUI

/// Shows 3 colored rectangles and 1 leaf using direct colors.  iOS 17
///
/// The leaf is using a color defined in the app's bundle.  Unsure what's new about
/// Image or that forgroundStyle.  For `.fill`, the ability to use a direct color or gradient seems
/// to be new in iOS 17.
///
/// - Requires: iOS 17
struct ColorExample: View {
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    let lemonYellow = Color(hue: 0.1639, saturation: 1, brightness: 1)
    let steelGray = Color(white: 0.4745)
    let aqua = Color("aqua") // Looks in your app's main bundle by default.

    var body: some View {
        HStack {
            Rectangle()
                .fill(skyBlue)

            Rectangle()
                .fill(lemonYellow)

            Rectangle()
                .fill(steelGray)
        }
        .frame(height: 200)
        .padding(.bottom)
        
        Image(systemName: "leaf.fill")
            .foregroundStyle(Color.green)
            .padding(.bottom)
        
        Text("\(aqua.description)")
    }
}

#Preview {
    ColorExample()
}
