//
//  Model.swift
//  WeatherAppHW
//
//  Created by Alexandr Barabash on 09.04.2022.
//

import Foundation


struct WeatherInMoscow: Codable {
    let timezone: String?
    let current: Current?
    
    init(indication: Any) {
        let weatherInMoscowData = indication as? [String: Any] ?? [:]
        
        timezone = weatherInMoscowData["timezone"] as? String ?? ""

        let currentData = weatherInMoscowData["current"] as? [String: Any] ?? [:]
        self.current = Current(indication: currentData)
    }
    
    static func getWeatherInMoscow(from value: Any) -> WeatherInMoscow {
        return WeatherInMoscow(indication: value)
        }
        
}

    
struct Current: Codable {
    let temp: Double?
    let weather: [Weather]?
    
    init(indication: [String: Any]) {
        self.temp = indication["temp"] as? Double ?? 0.0

        let weatherData = indication["weather"] as? [[String: Any]] ?? [[:]]
        self.weather = [Weather(indication: weatherData)]
    }
}

struct Weather: Codable {
    let description: String?
    
    init(indication: [[String: Any]]) {
        let weather = indication.first ?? [:]
        self.description = weather["description"] as? String ?? ""
    }
}



