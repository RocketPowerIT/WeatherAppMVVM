//
//  DetailViewCell.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 30/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import Foundation
import UIKit

class SearchViewCell: UITableViewCell {
       
        static let identifire = "SearchViewCell"
      
        var mvvmViewModel: SearchViewModel! {
            didSet {
                textLabel?.text = mvvmViewModel.city
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
}
