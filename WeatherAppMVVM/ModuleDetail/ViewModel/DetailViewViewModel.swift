//
//  DetailViewViewModel.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 31/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import Foundation

struct DetailViewViewModel {
    
    let city: String
    let icon: String
    let temp: String
    let feelsLike: String
    let averTemp: String
    
     init(from weatherModel: WeatherModel) {
         city = weatherModel.name
         icon = weatherModel.weather[0].icon
         temp = String(Int(weatherModel.main.temp))
         feelsLike = String(Int(weatherModel.main.feelsLike))
         averTemp = "Мин: " + String(Int(weatherModel.main.tempMin)) + " Макс: " + String(Int(weatherModel.main.tempMax))
     }
}
