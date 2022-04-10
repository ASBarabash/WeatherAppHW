//
//  NetworkManager.swift
//  WeatherAppHW
//
//  Created by Alexandr Barabash on 09.04.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let link = "https://api.openweathermap.org/data/2.5/onecall?lat=55.7522200&lon=37.6155600&exclude=daily&units=metric&lang=ru&appid=fb472cd9e7c8be3de77dbe0affe20b3f"
    
    private init() {}
    
    func fetchWeather(completion: @escaping (WeatherInMoscow?, Error?) -> (Void)) {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(response)
            do {
                let weatherInMoscow = try JSONDecoder().decode(WeatherInMoscow.self, from: data)
                DispatchQueue.main.async {
                    completion(weatherInMoscow, error)
                }
                print(weatherInMoscow)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
}
