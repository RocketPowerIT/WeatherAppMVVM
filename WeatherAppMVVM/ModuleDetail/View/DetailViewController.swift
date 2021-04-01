//
//  DetailViewController.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 31/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data: WeatherDataModel?
    var city:String = ""
    
    private var detailView: DetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()

        if data != nil {
            print(data!)
            detailView.configure(with: data!)
        } else {
            addBarButtonItem()
            fetchWeatherData(from: city)
            print(data!)
        }
        title = data?.name
        //  detailView.configure(with: data)
        
        
    }
    
    fileprivate func addBarButtonItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(SelectorAdd(param:)) )
    }
    
    @objc func SelectorAdd(param: UIBarButtonItem){
        print("Add")
        let mainViewController = MVVMTableViewController()
        mainViewController.weatherData.append(data!)
        navigationController? .pushViewController (mainViewController,
                                                   animated: false)
    }
    
    fileprivate func fetchWeatherData(from city: String) {
        let cityFormaterString:String = city.replacingOccurrences(of: " ", with: "+")
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(cityFormaterString)&lang=ru&units=metric&appid=d3b55b309878cef225f742270a74bcce"
        let data = try! Data(contentsOf: URL(string: url)!)
        Service.startFetch(of: WeatherDataModel.self, from: data) {
            result in
            switch result {
            case .success(let data):
                self.data = data
                self.detailView.configure(with: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func createView() {
        detailView = DetailView()
        detailView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        detailView.center = view.center
        view.addSubview(detailView)
    }
    
    
    
}
