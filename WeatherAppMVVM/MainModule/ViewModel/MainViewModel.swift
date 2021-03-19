//
//  MainViewModel.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 17/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData)->())? { get set }
    func startFetch(url: String)
}

final class MainViewModel: MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> ())?
    let networkService: NetworkService = NetworkService()
    
    init() {
        updateViewData?(.initial)
    }
    
    func startFetch(url: String) {
        // TODO: NETWORKING GET DATA FROM JSON
        
        networkService.parseJSON(url: url) { [weak self] result in
            switch result{
            case .success(let responce):
                //Get ImageID:String
                var imageID:String=""
                responce.weather.forEach({imageID=$0.icon})
                self!.networkService.downloadImage(from: imageID) { [weak self] (result) in
                    switch result {
                    case .success(let image):
                        //Init result model with image:UIImage()
                        self?.updateViewData?(.loading(ViewData.WeatherData(weatherImage: image,
                                                                            city: responce.name,
                                                                            temperature: String(responce.main.temp))))
                        break
                    case .failure(let error):
                        print(error)
                        break
                    }
                }
                print(responce)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
