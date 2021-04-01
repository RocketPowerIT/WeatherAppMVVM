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
    let id: Int
    let icon: String
    let temp: Double
    let feelsLike: Double

    
    init(_ mvvmModel: WeatherDataModel) {
        city = mvvmModel.name
        id = mvvmModel.id
        icon = mvvmModel.weather[0].icon
        temp = mvvmModel.main.temp
        feelsLike = mvvmModel.main.feelsLike
    }
}
