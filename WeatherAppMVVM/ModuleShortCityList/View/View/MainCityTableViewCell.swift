//
//  MVVMTableViewCell.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 23/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

class MainCityTableViewCell: UITableViewCell {
    
    static let identifire = "MainCityTableViewCell"
    let network = NetworkService()
    lazy var weatherIcon = makeImageView()
    lazy var cityLabel = makeCityLabel()
    lazy var tempLabel = makeTemperatureLabel()
    lazy var averTemp = makeAverageTemperatureLabel()
    
    var cityViewModel: MainCityViewModel! {
        didSet {
            tempLabel.text = cityViewModel.city
            weatherIcon.image = network.getImage(fromID: cityViewModel!.icon)
            cityLabel.text = cityViewModel.temp
            averTemp.text = cityViewModel.averTemp
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    fileprivate func configureCell() {
        
        NSLayoutConstraint.activate([
            //weather Icon (cloud\rain\...)
            weatherIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            //cityLabel
            cityLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: weatherIcon.leadingAnchor, multiplier: 1),
            cityLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            //average temperature
            averTemp.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension MainCityTableViewCell {
    
    
    
}
