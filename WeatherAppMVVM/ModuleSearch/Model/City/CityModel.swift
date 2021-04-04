//
//  CityDataJson.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 29/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import Foundation

struct CityModel: Codable {
        let administrativeArea: AdministrativeArea?
        let country: AdministrativeArea?
        let key: String?
        let localizedName: String?
    }

    // MARK: - AdministrativeArea
struct AdministrativeArea: Codable {
       
        let id: String?
        let localizedName: String?
    }
