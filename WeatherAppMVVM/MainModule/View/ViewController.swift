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
    
    let url = "https://api.openweathermap.org/data/2.5/weather?id=498525&lang=ru&units=metric&appid=d3b55b309878cef225f742270a74bcce"
    
    override func viewDidLoad() {
        viewModel = MainViewModel()
        super.viewDidLoad()
        createView()
        updateView()
    }
    
    private func createView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        view.addSubview(testView)
    }

    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }
    
    @IBAction func getDataAction(_ sender: Any) {
        viewModel.startFetch(url: url)
    }
    
}

