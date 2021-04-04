//
//  ViewController.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 17/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var viewModel: MainViewModelProtocol!
    private var testView: TestView!

    let cityURL = "http://bulk.openweathermap.org/sample/city.list.json.gz"
    override func viewDidLoad() {
        viewModel = MainViewModel()
        super.viewDidLoad()
 
        createView()
        updateView()
        
        
            //  fetchCity(URL(string: ""))
    }
    
    private func createView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        testView.center = view.center
        view.addSubview(testView)
    }

    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }
   
    func getWeatherData(url:String){
        viewModel.startFetch(url: url)
    }
    
}

