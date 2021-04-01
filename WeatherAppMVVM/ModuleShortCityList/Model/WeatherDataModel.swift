//
//  WeatherDataHelper.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 19/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

struct WeatherDataModel: Codable {
     var coord: Coord!
     var weather: [Weather]!
     var main: Main!
     var visibility: Int!
     var wind: Wind!
     var clouds: Clouds!
     var dt: Int!
     var sys: Sys!
     var timezone: Int!
     var id: Int!
     var name: String!
     var cod: Int!
     enum CodingKeys: String, CodingKey {
         case coord = "coord"
         case weather = "weather"
         case main = "main"
         case visibility = "visibility"
         case wind = "wind"
         case clouds = "clouds"
         case dt = "dt"
         case sys = "sys"
         case timezone = "timezone"
         case id = "id"
         case name = "name"
         case cod = "cod"
     }
     
     // MARK: - Clouds
     struct Clouds: Codable {
         let all: Int
         
         enum CodingKeys: String, CodingKey {
             case all = "all"
         }
     }
     
     // MARK: - Coord
     struct Coord: Codable {
         let lon: Double
         let lat: Double
         
         enum CodingKeys: String, CodingKey {
             case lon = "lon"
             case lat = "lat"
         }
     }
     
     // MARK: - Main
     struct Main: Codable {
         var temp: Double
         let feelsLike: Double
         let tempMin: Double
         let tempMax: Double
         let pressure: Int
         let humidity: Int
         let seaLevel: Int?
         let grndLevel: Int?
         
         enum CodingKeys: String, CodingKey {
             case temp = "temp"
             case feelsLike = "feels_like"
             case tempMin = "temp_min"
             case tempMax = "temp_max"
             case pressure = "pressure"
             case humidity = "humidity"
             case seaLevel = "sea_level"
             case grndLevel = "grnd_level"
         }
     }
     
     // MARK: - Sys
     struct Sys: Codable {
         let country: String
         let sunrise: Int
         let sunset: Int
         
         enum CodingKeys: String, CodingKey {
             case country = "country"
             case sunrise = "sunrise"
             case sunset = "sunset"
         }
     }
     
     // MARK: - Weather
     struct Weather: Codable {
         let id: Int
         let main: String
         let weatherDescription: String
         var icon: String
         
         enum CodingKeys: String, CodingKey {
             case id = "id"
             case main = "main"
             case weatherDescription = "description"
             case icon = "icon"
         }
     }
     
     // MARK: - Wind
     struct Wind: Codable {
         let speed: Double
         let deg: Int
         let gust: Double?
         
         enum CodingKeys: String, CodingKey {
             case speed = "speed"
             case deg = "deg"
             case gust = "gust"
         }
     }
 }

