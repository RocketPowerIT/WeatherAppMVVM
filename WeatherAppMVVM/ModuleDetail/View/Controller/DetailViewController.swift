//
//  DetailViewController.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 31/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var detailViewViewModel:DetailViewViewModel? // base single data from MainTableViewController
    private var detailView: DetailView!
    var cityId:String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        if cityId.count>0 {
            addBarButtonItem()
        }
        
        createView()
        setConstraint()
        detailView.configureView(withViewModel: detailViewViewModel!)
    }
    
    fileprivate func addBarButtonItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(SelectorAdd(param:)) )
    }
    
    fileprivate func setConstraint(){
        let frameY = detailView.frame.height
      //  let frameX = detailView.frame.width
        let paddingY = frameY/10
        
        detailView.cityLabel.topAnchor.constraint(equalTo: self.detailView.topAnchor,constant: frameY/8).isActive = true
        detailView.cityLabel.centerXAnchor.constraint(equalTo: self.detailView.centerXAnchor).isActive = true
        
        detailView.weatherIcon.topAnchor.constraint(equalTo: self.detailView.cityLabel.bottomAnchor, constant: paddingY).isActive = true
        detailView.weatherIcon.centerXAnchor.constraint(equalTo: self.detailView.centerXAnchor).isActive = true
        
        detailView.tempLabel.topAnchor.constraint(equalTo: self.detailView.weatherIcon.bottomAnchor, constant: paddingY).isActive = true
        detailView.tempLabel.centerXAnchor.constraint(equalTo: self.detailView.centerXAnchor).isActive = true
        
        detailView.averTemp.topAnchor.constraint(equalTo: self.detailView.tempLabel.bottomAnchor, constant: paddingY).isActive = true
        detailView.averTemp.centerXAnchor.constraint(equalTo: self.detailView.centerXAnchor).isActive = true
        
    }
    
    @objc func SelectorAdd(param: UIBarButtonItem){
        print("Add")
Singleton.shared.urlList.append("https://api.openweathermap.org/data/2.5/weather?q=\(cityId)&lang=ru&units=metric&appid=d3b55b309878cef225f742270a74bcce")
        navigationController?.popToRootViewController(animated: true)
    }
    private func createView() {
        detailView = DetailView()
        detailView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        detailView.backgroundColor = .red
        detailView.center = view.center
        view.addSubview(detailView)
    }
}
