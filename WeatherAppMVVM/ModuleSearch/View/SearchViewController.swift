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
    private var сityModel = [CityDataJson]()
    
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
        
        guard let url = URL(string: "https://www.accuweather.com/web-api/autocomplete?query=\(citySearch)&language=en") else { return }
        let data = try! Data(contentsOf: url)
        Service.startFetch(of: [CityDataJson].self, from: data) {  result in
            switch result {
            case .success(let data):
                for value in data {
                    self.сityModel.append(value)
                }
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
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
        let vc = DetailViewController()
        
       
        vc.city = сityModel[indexPath.row].localizedName!
        
        
        navigationController?.pushViewController(vc, animated: true)
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
