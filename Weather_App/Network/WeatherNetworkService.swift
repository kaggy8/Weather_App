//
//  WeatherNetworkService.swift
//  Weather_App
//
//  Created by Stanislav Demyanov on 31.07.2023.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchWeatherData(for city: String, completion: @escaping (WeatherData?, Error?) -> Void)
}

class WeatherService: WeatherServiceProtocol {
    private let apiKey = "86b122412e0bdc051a5c80235678c54a"
    
    func fetchWeatherData(for city: String, completion: @escaping (WeatherData?, Error?) -> Void) {
        let lang = Locale.current.language.languageCode?.identifier ?? "en"
        let currentLang = lang == "ru" ? "ru" : "en"
        
        guard let encodedCity = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            completion(nil, NSError(domain: "Invalid city name", code: 0, userInfo: nil))
            return
        }
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(encodedCity)&appid=\(apiKey)&units=metric&lang=\(currentLang)"
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "No data", code: 0, userInfo: nil))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
                completion(decodedData, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
