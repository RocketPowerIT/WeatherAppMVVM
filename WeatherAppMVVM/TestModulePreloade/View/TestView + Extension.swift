//
//  TestView + Extension.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 17/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

extension TestView {
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier:1).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return imageView
    }
    
    func makeActivityIndicatorView() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        activityIndicator.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 5).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addSubview(activityIndicator)
        return activityIndicator
    }
    
    func makeCityLabel() -> UILabel {
        let titleLabel = makeLabel(size: 20)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return titleLabel
    }
    
    func makeTemperatureLabel() -> UILabel {
        let descriptionLabel = makeLabel(size: 14)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 10).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return descriptionLabel
    }
    
    func makeDescriptionLabel() -> UILabel {
        let titleLabel = makeLabel(size: 20)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 5).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
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
