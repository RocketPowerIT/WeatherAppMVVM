//
//  DetailView.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 31/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

protocol DetailViewProtocol {
   
}

class DetailView: UIView {

    let network = NetworkService()
       lazy var weatherIcon = makeImageView()
       lazy var cityLabel = makeCityLabel()
       lazy var tempLabel = makeTemperatureLabel()
       lazy var averTemp = makeAverageTemperatureLabel()
    
    public func configureView(withViewModel viewModel:DetailViewViewModel){
        self.weatherIcon.image = network.getImage(fromID: viewModel.icon)
        self.cityLabel.text = viewModel.city
        self.tempLabel.text = viewModel.temp
        self.averTemp.text = viewModel.averTemp
    }
}
