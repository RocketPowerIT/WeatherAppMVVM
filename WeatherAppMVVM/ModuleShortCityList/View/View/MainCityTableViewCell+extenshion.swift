//
//  MainCityView.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 01/04/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

extension MainCityTableViewCell{
    
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        return imageView
    }
    func makeCityLabel() -> UILabel {
        let titleLabel = makeLabel(size: 20)
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        return titleLabel
    }
    
    func makeTemperatureLabel() -> UILabel {
        let titleLabel = makeLabel(size: 35)
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        return titleLabel
    }
    func makeAverageTemperatureLabel() -> UILabel {
        let titleLabel = makeLabel(size: 20)
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        return titleLabel
    }
    
    
    func makeLabel(size: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: size)
        addSubview(label)
        return label
    }
}
