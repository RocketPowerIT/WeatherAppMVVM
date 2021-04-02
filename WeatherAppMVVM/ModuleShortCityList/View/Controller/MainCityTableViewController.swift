//
//  MVVMTableViewController.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 23/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

class MainCityTableViewController: UITableViewController {
    
    var weatherModel: [WeatherModel] = []
    let networkService = NetworkService()
    var defSetting = DefaultSettings()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WeatherMainScreen"
        tableView.register(MainCityTableViewCell.self, forCellReuseIdentifier: MainCityTableViewCell.identifire)
        fetchWeatherData()
        addBarButtonItem()
        print(defSetting.url.count)
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
        for url in defSetting.url {
            networkService.weatherFetch(url: url) { result in
                switch result {
                case .success(let data):
                    print(data)
                    self.weatherModel.append(data)
                    self.tableView.reloadData()

                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

extension MainCityTableViewController {
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherModel.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainCityTableViewCell.identifire, for: indexPath) as! MainCityTableViewCell
        cell.cityViewModel = MainCityViewModel(from: weatherModel[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        let item = weatherModel[indexPath.row]
        vc.detailViewViewModel = DetailViewViewModel(from: item)
        navigationController?.pushViewController(vc, animated: true)
    }
}
