//
//  DetailViewModel.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 30/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import Foundation

struct SearchViewModel {
    let city: String
    
    init(_ mvvmCityModel: CityDataJson) {
        city = mvvmCityModel.localizedName!
    }
}
