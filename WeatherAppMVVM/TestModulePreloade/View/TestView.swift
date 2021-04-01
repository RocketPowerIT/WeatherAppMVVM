//
//  TestView.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 17/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit
import SwiftUI

class TestView: UIView {
    
    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var activityIndicator = makeActivityIndicatorView()
    lazy var imageView = makeImageView()
    lazy var cityLabel = makeCityLabel()
    lazy var temperatureLabel = makeTemperatureLabel()
    lazy var descriptionLabel = makeDescriptionLabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        switch viewData {
        case .initial:
            print("IsInitial")
            update(viewData: nil, isHiden: true)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            break
        case .loading(let loading):
            print("loading")
            update(viewData: loading, isHiden: false)
            activityIndicator.isHidden = false
            activityIndicator.stopAnimating()
            break
        case .success(let success):
            print("success")
            update(viewData: success, isHiden: false)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            break
        case .failure(let failure):
            update(viewData: failure, isHiden: false)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            break
        }
    }
    
    private func update(viewData: ViewData.WeatherData? , isHiden: Bool) {
        
        imageView.image = viewData?.weatherImage
        cityLabel.text = viewData?.city
        temperatureLabel.text = viewData?.temperature
        descriptionLabel.text = viewData?.weatherDescription
        cityLabel.isHidden = isHidden
        imageView.isHidden = isHidden
        temperatureLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
    }
    
    
}
