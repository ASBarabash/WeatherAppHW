//
//  ViewController.swift
//  WeatherAppHW
//
//  Created by Alexandr Barabash on 09.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var infoLabel: UILabel!
    
    private let weather = NetworkManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.layer.cornerRadius = 10
        infoLabel.layer.masksToBounds = true
        weather.fetchWeather { weatherInMoscow, error in
            if let error = error {
                print(error)
                return
            }
            
            self.infoLabel.text = """
                Сегодня в
                \(weatherInMoscow?.timezone ?? "") \(weatherInMoscow?.current?.weather?[0].description ?? "")
                Температура: \(weatherInMoscow?.current?.temp ?? 00) по цельсию.
                """
        }
    }
}

