//
//  DefaultSettings.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 23/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import Foundation

final class Singleton {
    
    private init() { }
    
    static let shared = Singleton()
    
    var urlList:[String] = {
        var url = [String]()
        url.append("https://api.openweathermap.org/data/2.5/weather?id=498525&lang=ru&units=metric&appid=d3b55b309878cef225f742270a74bcce")
        url.append("https://api.openweathermap.org/data/2.5/weather?id=524901&lang=ru&units=metric&appid=d3b55b309878cef225f742270a74bcce")
        url.append("https://api.openweathermap.org/data/2.5/weather?id=498817&lang=ru&units=metric&appid=d3b55b309878cef225f742270a74bcce")
        url.append("https://api.openweathermap.org/data/2.5/weather?q=Sarov&lang=ru&units=metric&appid=d3b55b309878cef225f742270a74bcce")
        return url
    }()
}
