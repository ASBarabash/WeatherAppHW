//
//  Model.swift
//  WeatherAppHW
//
//  Created by Alexandr Barabash on 09.04.2022.
//

struct WeatherInMoscow: Decodable {
    let timezone: String?
    let current: Current?
}

struct Current: Decodable {
    let temp: Double?
    let weather: [Weather]?
}

struct Weather: Decodable {
    let description: String?
}


