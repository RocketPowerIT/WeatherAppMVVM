//
//  DefaultSettings.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 23/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import Foundation

struct DefaultSettings {
    
    var url = [String]()
    
    init() {
        url = ["https://api.openweathermap.org/data/2.5/weather?id=498525&lang=ru&units=metric&appid=d3b55b309878cef225f742270a74bcce",
               "https://api.openweathermap.org/data/2.5/weather?id=524901&lang=ru&units=metric&appid=d3b55b309878cef225f742270a74bcce",
               "https://api.openweathermap.org/data/2.5/weather?id=498817&lang=ru&units=metric&appid=d3b55b309878cef225f742270a74bcce"]
    }
    
    mutating func addNewUrl(city:String){
        url.append("https://api.openweathermap.org/data/2.5/weather?q=\(city)&lang=ru&units=metric&appid=d3b55b309878cef225f742270a74bcce")
    }
    
    
    
}
