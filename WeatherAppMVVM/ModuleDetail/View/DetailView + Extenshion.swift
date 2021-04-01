//
//  DetailView + Extenshion.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 31/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

extension DetailView {
    

    
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier:1).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return imageView
    }
    
    func makeCityLabel() -> UILabel {
        
        let titleLabel = makeLabel(size: 20)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.1).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return titleLabel
    }
    
     func makeTemperatureLabel() -> UILabel {
         let descriptionLabel = makeLabel(size: 14)
         descriptionLabel.numberOfLines = 0
        descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.2).isActive = true
         descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
         return descriptionLabel
     }
     
     func makeDescriptionLabel() -> UILabel {
         let titleLabel = makeLabel(size: 20)
         titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
         titleLabel.numberOfLines = 0
         titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.3).isActive = true
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
