//
//  ViewData.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 17/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

enum ViewData {
    case initial
    case loading(WeatherData)
    case success(WeatherData)
    case failure(WeatherData)
    
    struct WeatherData {
        var weatherImage = UIImage()
        var city = String()
        var temperature = String()
        var weatherDescription = String()
    }
    
}



