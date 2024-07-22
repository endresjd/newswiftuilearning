//
//  KeyboardExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/16/24.
//

import SwiftUI

struct KeyboardExample: View {
    /// Focus values for the hidden Text views
    private enum Field: Hashable {
        case currencyField
        case codeField
    }
    
    /// Which view is accpepting input, if any
    @FocusState private var focusedField: Field?
    
    /// First digit of the code
    @State private var digitOne = " "
 
    /// Second digit of the code
    @State private var digitTwo = " "
    
    /// Third digit of the code
    @State private var digitThree = " "
    
    /// Fourth digit of the code
    @State private var digitFour = " "
    
    /// Fifth digit of the code
    @State private var digitFive = " "
 
    /// Backing value for the code that is tied to the code hidden TextField
    @State private var code = ""
    
    /// Backing value for money that is tied to the money hidden TextField
    @State private var money = ""
    
    /// Text for the generic TextField
    @State private var text = ""
    
    /// Size to use for the number entry box.  Scales with dynamic text
    @ScaledMetric private var numberSize = 50.0
    
    /// Naive way to prevent the rectangles from getting too large.
    private var clampedScale: Double {
        let clampedValue: Double
        
        switch codeSize {
        case 4:
            clampedValue = 80
        case 5:
            clampedValue = 70
        default:
            clampedValue = 90
        }
        
        if numberSize > clampedValue {
            return clampedValue
        }
        
        return numberSize
    }
    
    private let codeSize = 5
    
    /// Takes the value in `money` and transforms it into US formatted currency.  If
    /// there are problems or no value, this returns "$0.00"
    private var formattedMoney: String {
        if let value = Decimal(string: money) {
            return value
                .formatted(
                    .currency(code: "USD")
                    .rounded(rule: .down)
                    .locale(Locale(identifier: "en_US"))
                )
        }
        
        return "$0.00"
    }
    
    var body: some View {
        ScrollView {
            Text("Raw: \(money)")
            Text("Formatted: \(formattedMoney)")
            
            // The `onChange` modifier is a simple filter on input that doesn't
            // allow incorrect currency amounts to be entered
            TextField("", text: $money)
                .keyboardType(.decimalPad)
                .submitLabel(.done)
                .focused($focusedField, equals: .currencyField)
                .frame(height: 0)
                .opacity(0)
                .onChange(of: money) { oldValue, newValue in
                    // Just get what we want
                    let filtered = String(newValue.unicodeScalars.filter(CharacterSet(charactersIn: "0123456789.").contains))

                    // Don't allow more than one decimal point
                    let newOccurences = filtered.filter { character in
                        character == "."
                    }.count
                    
                    if newOccurences > 1 {
                        money = oldValue
                        
                        return
                    }
 
                    // Second, don't allow more than 2 decimal numbers
                    let parts = filtered.split(separator: ".")
 
                    if parts.count > 1, let last = parts.last, last.count > 2 {
                        money = oldValue
                    } else if money != filtered {
                        // If something got filtered out, then reset the field to what we want
                        money = filtered
                    }
                }
 
            Button("Enter money") {
                focusedField = .currencyField
            }
 
            Divider()
 
            Text("Rectangle size: \(numberSize) by \(numberSize)")
            
            Grid {
                GridRow {
                    Text(digitOne)
                        .frame(width: clampedScale, height: clampedScale)
 
                    Text(digitTwo)
                        .frame(width: clampedScale, height: clampedScale)
 
                    Text(digitThree)
                        .frame(width: clampedScale, height: clampedScale)
 
                    Text(digitFour)
                        .frame(width: clampedScale, height: clampedScale)
 
                    Text(digitFive)
                        .frame(width: clampedScale, height: clampedScale)
                }
                .border(.green, width: 2)
            }
            
            TextField("", text: $code)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .focused($focusedField, equals: .codeField)
                .frame(height: 0)
                .opacity(0)
                .onChange(of: code) { oldValue, newValue in
                    let filtered = String(newValue.unicodeScalars.filter(CharacterSet(charactersIn: "0123456789").contains))

                    guard filtered.count <= codeSize else {
                        code = oldValue
                        
                        return
                    }
                    
                    if code != filtered {
                        code = filtered
                    }
                    
                    let padded = code.padding(toLength: codeSize, withPad: " ", startingAt: 0)
                    var fullCode = [String]()
                    
                    for character in padded {
                        fullCode.append(String(character))
                    }
                    
                    digitOne = fullCode[0]
                    digitTwo = fullCode[1]
                    digitThree = fullCode[2]
                    digitFour = fullCode[3]
                    digitFive = fullCode[4]
                }
 
            Button("Enter code") {
                focusedField = .codeField
            }
            
            Divider()
 
            // Still suffers from the cursor changing position
            TextField("Enter letters", text: $text)
                .keyboardType(.asciiCapable)
                .submitLabel(.done)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(.horizontal)
                .onChange(of: text) { oldValue, newValue in
                    let result = String(newValue.unicodeScalars.filter(CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").contains))
 
                    text = result.uppercased()
                }
                .onSubmit {
                    print("DONE! [\(text)]")
                }
        }
    }
}
 
#Preview {
    KeyboardExample()
}
