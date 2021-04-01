//
//  MVVMTableViewCell.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 23/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

class MVVMTableViewCell: UITableViewCell {
    
    static let identifire = "MVVMTableViewCell"
  
    var mvvmViewModel: MVVMViewModel! {
        didSet {
            textLabel?.text = mvvmViewModel.city
            detailTextLabel?.text = String(mvvmViewModel.id)
            weatherIcon.image=Service.getImage(fromID: mvvmViewModel!.icon)
            titleLabel.text = String(Int(mvvmViewModel.temp))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        // imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.rightAnchor.constraint(equalTo: weatherIcon.leftAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
            //label.bottomAnchor.constraint()
        ])
        return label
    }()
}

extension MVVMTableViewCell {
    

    
}
