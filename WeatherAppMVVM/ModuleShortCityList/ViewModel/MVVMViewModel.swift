//
//  MVVMViewModel.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 23/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import Foundation
import UIKit

struct MVVMViewModel {
    let city: String
    let id: Int
    let icon: String
    let temp: Double
    let feelsLike: Double

    
    init(_ mvvmWeatherModel: WeatherDataModel) {
        city = mvvmWeatherModel.name
        id = mvvmWeatherModel.id
        icon = mvvmWeatherModel.weather[0].icon
        temp = mvvmWeatherModel.main.temp
        feelsLike = mvvmWeatherModel.main.feelsLike
    }
}
