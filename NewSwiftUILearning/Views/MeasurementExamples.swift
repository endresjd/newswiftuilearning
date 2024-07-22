//
//  MeasurementExamples.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 7/18/24.
//

import SwiftUI

struct MeasurementExamples: View {
    let oneMeter = Measurement(value: 1, unit: UnitLength.meters)
    let oneSquareMeter = Measurement(value: 1, unit: UnitArea.squareMeters)
    let oneSecond = Measurement(value: 1, unit: UnitDuration.seconds)
    let fortyFiveDegrees = Measurement(value: 14, unit: UnitAngle.degrees)
    let oneGravity = Measurement(value: 1, unit: UnitAcceleration.gravity)
    let gramsPerLiter = Measurement(value: 1, unit: UnitConcentrationMass.gramsPerLiter)
    let oneCoulomb = Measurement(value: 1, unit: UnitElectricCharge.coulombs)
    let oneAmpere = Measurement(value: 1, unit: UnitElectricCurrent.amperes)
    let oneVolt = Measurement(value: 1, unit: UnitElectricPotentialDifference.volts)
    let oneOhm = Measurement(value: 1, unit: UnitElectricResistance.ohms)
    let oneJoule = Measurement(value: 1, unit: UnitEnergy.joules)
    let oneHertz = Measurement(value: 1, unit: UnitFrequency.hertz)
    let oneMPG = Measurement(value: 1, unit: UnitFuelEfficiency.milesPerGallon)
    let oneByte = Measurement(value: 1, unit: UnitInformationStorage.bytes)
    let oneKG = Measurement(value: 1, unit: UnitMass.kilograms)
    let oneKilowatt = Measurement(value: 1, unit: UnitPower.kilowatts)
    let oneNewtonPressure = Measurement(value: 1, unit: UnitPressure.newtonsPerMetersSquared)
    let oneMPH = Measurement(value: 1, unit: UnitSpeed.milesPerHour)

    var measurements: [String] {
        // AnyObject is a protocol to which all classes implicitly conform
        //      All classes, class types, or class-only protocols can use AnyObject as their concrete type
        //      Reference types
        // Any can represent an instance of any type at all, including function types
        //      Reference and value
        // any is used to indicate the use of an existential
         
        // Kinda sucks we can be more restrictive on the type
        // Also sucks that this couldn't be in a lazy var.  Maybe I don't get those.
        let measurements: [(Any, Any)] = [
            (oneMeter, oneMeter.converted(to: .feet)),
            (oneSquareMeter, oneSquareMeter.converted(to: .squareFeet)),
            (oneSecond, oneSecond.converted(to: .microseconds)),
            (fortyFiveDegrees, fortyFiveDegrees.converted(to: .radians)),
            (oneGravity, oneGravity.converted(to: .metersPerSecondSquared)),
            (gramsPerLiter, gramsPerLiter.converted(to: .milligramsPerDeciliter)),
            (oneCoulomb, oneCoulomb.converted(to: .ampereHours)),
            (oneAmpere, oneAmpere.converted(to: .milliamperes)),
            (oneVolt, oneVolt.converted(to: .millivolts)),
            (oneOhm, oneOhm.converted(to: .megaohms)),
            (oneJoule, oneJoule.converted(to: .calories)),
            (oneHertz, oneHertz.converted(to: .framesPerSecond)),
            (oneMPG, oneMPG.converted(to: .litersPer100Kilometers)),
            (oneByte, oneByte.converted(to: .nibbles)),
            (oneKG, oneKG.converted(to: .metricTons)),
            (oneKilowatt, oneKilowatt.converted(to: .horsepower)),
            (oneNewtonPressure, oneNewtonPressure.converted(to: .millimetersOfMercury)),
            (oneMPH, oneMPH.converted(to: .kilometersPerHour)),
        ]

        return measurements.map { measurement in
            "\(measurement.0) --> \(measurement.1)"
        }
    }
    
    var body: some View {
        ScrollView {
            ForEach(measurements, id: \.self) { measurement in
                Text(measurement)
            }
        }
    }
}

#Preview {
    MeasurementExamples()
}
