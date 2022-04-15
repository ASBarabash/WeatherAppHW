//
//  ViewController.swift
//  WeatherAppHW
//
//  Created by Alexandr Barabash on 09.04.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet var infoLabel: UILabel!
    

//    private let weather = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.layer.cornerRadius = 10
        infoLabel.layer.masksToBounds = true
        fetchWeatherWithAlamofire()
        
         
//Это старый вариант:
//        weather.fetchWeather { weatherInMoscow, error in
//            if let error = error {
//                print(error)
//                return
//            }
//
//            self.infoLabel.text = """
//                Сегодня в
//                \(weatherInMoscow?.timezone ?? "") \(weatherInMoscow?.current?.weather?[0].description ?? "")
//                Температура: \(weatherInMoscow?.current?.temp ?? 00) по цельсию.
//                """
//        }
    }
    func fetchWeatherWithAlamofire() {
        AF.request(link)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let weatherData = value as? [String: Any] else { return }
                    guard let current = weatherData["current"] as? [String: Any] else { return }
                    guard let weather = current["weather"] as? [[String: Any]] else { return }
                    
                    
                    print(weather)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
    
    

