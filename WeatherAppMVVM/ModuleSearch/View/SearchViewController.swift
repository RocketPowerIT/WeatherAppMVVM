//
//  DetailViewController.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 29/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchBarDelegate {
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var сityModel = [CityModel]()
     var networking = NetworkService()
    
    fileprivate func initSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSearchBar()
        tableView.register(SearchViewCell.self, forCellReuseIdentifier: SearchViewCell.identifire)
    }
    
    fileprivate func fetchCityList(searchCityName citySearch:String) {
        
        let url = "https://www.accuweather.com/web-api/autocomplete?query=\(citySearch)&language=en"
        print(url)
        networking.cityFetch(url: url) { result in
            switch result {
            case .success(let data):
                print(data)
                data.forEach{ self.сityModel.append($0)
                }
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return сityModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchViewCell.identifire, for: indexPath) as! SearchViewCell
        cell.mvvmViewModel = SearchViewModel(сityModel[indexPath.row])
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
        let cityString = сityModel[indexPath.row].localizedName!
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(cityString)&lang=ru&units=metric&appid=d3b55b309878cef225f742270a74bcce"
        networking.weatherFetch(url: url) { result in
            switch result {
            case .success(let data):
                let vc = DetailViewController()
                vc.detailViewViewModel = DetailViewViewModel(from: data)
                vc.cityId=cityString
                self.navigationController?.pushViewController(vc, animated: true)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBar(_ searcBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        сityModel.removeAll()
        fetchCityList(searchCityName: searchText)
    }
}
