//
//  WeatherViewModel.swift
//  Weather_App
//
//  Created by Stanislav Demyanov on 31.07.2023.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var temperature: Double?
    @Published var weatherDescription: String = ""
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var currentDate: Date? = nil
    
    
    private let weatherService: WeatherServiceProtocol
    
    init(weatherService: WeatherServiceProtocol = WeatherService()) {
        self.weatherService = weatherService
    }
    
    func fetchWeatherData(for city: String) {
            if city.isEmpty {
                showAlert(message: NSLocalizedString("EmptyCityMessage", comment: ""))
                return
            }
            
            weatherService.fetchWeatherData(for: city) { [weak self] weatherData, error in
                if let error = error {
                    print("Error: \(error)")
                    self?.showAlert(message: NSLocalizedString("InvalidCityMessage", comment: ""))
                    return
                }
                
                DispatchQueue.main.async {
                    self?.temperature = weatherData?.main.temp
                    self?.weatherDescription = weatherData?.weather.first?.description ?? ""
                    self?.currentDate = Date()
                }
            }
        }
        
        private func showAlert(message: String) {
            DispatchQueue.main.async {
                self.showAlert = true
                self.alertMessage = message
            }
        }
}
