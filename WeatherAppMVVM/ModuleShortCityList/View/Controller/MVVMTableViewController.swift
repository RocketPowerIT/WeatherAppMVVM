//
//  MVVMTableViewController.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 23/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

class MVVMTableViewController: UITableViewController {
    
    var weatherData: [WeatherDataModel] = []
    let defaultUrl = DefaultSettings().url
    var defSetting = DefaultSettings()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WeatherMainScreen"
        tableView.register(MVVMTableViewCell.self, forCellReuseIdentifier: MVVMTableViewCell.identifire)
        fetchWeatherData()
        tableView.reloadData()
        addBarButtonItem()
        print(weatherData.count)
    }
    
    fileprivate func addBarButtonItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(SelectorAdd(param:)) )
    }
    
    @objc func SelectorAdd(param: UIBarButtonItem){
        print("Add")
        let nextViewController = SearchViewController()
        navigationController? .pushViewController (nextViewController,
                                                   animated: false)
    }
    
    fileprivate func fetchWeatherData() {
        for url in defaultUrl {
            let data = try! Data(contentsOf: URL(string: url)!)
            Service.startFetch(of: WeatherDataModel.self, from: data) {
                result in
                switch result {
                case .success(let data):
                    self.weatherData.append(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MVVMTableViewCell.identifire, for: indexPath) as! MVVMTableViewCell
        cell.mvvmViewModel = MVVMViewModel(weatherData[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.data = weatherData[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
