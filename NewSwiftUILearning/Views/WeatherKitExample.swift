//
//  WeatherKitExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 12/13/23.
//

import SwiftUI
import WeatherKit
import CoreLocation

/// Uses iOS 16's `WeatherService` to print weather for the current location.
///
/// `WeatherService` provides an interface for obtaining weather data
///
/// - Requires: iOS 16
struct WeatherKitExample: View {
    private var locationManager = LocationManager()
    @State private var location: CLLocation?
    @State private var errorMessage = ""
    
    func weatherStuff(location: CLLocation) async throws {
        let weatherService = WeatherService()
        let weather = try await weatherService.weather(for: location)
        let temperature = weather.currentWeather.temperature
        let uvIndex = weather.currentWeather.uvIndex
        
        print(weatherService)
        print(location)
        print(weather)
        print(temperature)
        print(uvIndex)
    }
    
    var body: some View {
        VStack {
            Text("Needs more setup")
            Text(errorMessage)
            
            Button("Get Weather") {
                Task {
                    do {
                        let location = try await locationManager.location
                        
                        try await weatherStuff(location: location)
                    } catch {
                        errorMessage = error.localizedDescription
                    }
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    WeatherKitExample()
}
