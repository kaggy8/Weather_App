//
//  ContentView.swift
//  Weather_App
//
//  Created by Stanislav Demyanov on 31.07.2023.
//

import SwiftUI

struct WeatherView: View {
    @State private var city: String = ""
    @ObservedObject private var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack {
                WeatherImageView()
                
                CityInputView(city: $city)
                    .onSubmit {
                        weatherViewModel.fetchWeatherData(for: city)
                    }
                
                WeatherButtonView {
                    weatherViewModel.fetchWeatherData(for: city)
                }
                
                TemperatureView(temperature: weatherViewModel.temperature)
                
                WeatherDescriptionView(description: weatherViewModel.weatherDescription)
            }
        }
        
        .onTapGesture {
            hideKeyboard()
        }
        
        .alert(isPresented: $weatherViewModel.showAlert) {
            Alert(
                title: Text(LocalizedStringKey("Error")),
                message: Text(weatherViewModel.alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
