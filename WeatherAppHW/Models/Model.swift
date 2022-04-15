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
    
    init(indication: [String: Any]) {

        timezone = indication["timezone"] as? String

        let current = indication["current"] as? [String: Any] ?? [:]
        self.current = Current(indication: current)
    }
    
//    static func getWeatherInMoscow(from value: Any) -> WeatherInMoscow {
//        
//    }
}
    
struct Current: Codable {
    let temp: Double?
    let weather: [Weather]?
    
    init(indication: [String: Any]) {
        temp = indication["temp"] as? Double

        let weather = indication["weather"] as? [String: Any] ?? [:]
        self.weather = [Weather(indication: weather)]
    }
}

struct Weather: Codable {
    let description: String?
    
    init(indication: [String: Any]) {
        description = indication["description"] as? String
    }
}



