//
//  DetailView.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 31/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
       lazy var imageView = makeImageView()
       lazy var cityLabel = makeCityLabel()
       lazy var temperatureLabel = makeTemperatureLabel()
       lazy var descriptionLabel = makeDescriptionLabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        self.backgroundColor = .red
    }
    
    public func configure(with viewModel:WeatherDataModel){
        cityLabel.text = "City: \(viewModel.name!)"
        temperatureLabel.text = "Temperature: \( String(viewModel.main.temp))"
        descriptionLabel.text = "Feels like: \(String(viewModel.main.feelsLike))"
    }
}
