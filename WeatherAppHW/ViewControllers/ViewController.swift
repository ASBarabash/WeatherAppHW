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
        
        NetworkManager.shared.fetchWeatherWithAlamofire { result in
            switch result {
            case .success(let weather):
                self.infoLabel.text = """
                Сегодня в
                \(weather.timezone ?? "") \(weather.current?.weather?[0].description ?? "")
                Температура: \(weather.current?.temp ?? 00)
                """
            case .failure(let error):
                print(error)
            }
        }
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

}
    
    

