//
//  NetworkService.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 17/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import Foundation
import UIKit

class NetworkService {
    
    func weatherFetch(url: String,  completion: @escaping (Result<WeatherModel, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let result = try JSONDecoder().decode(WeatherModel.self, from: data)
                    completion(.success(result))
                    
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    func cityFetch(url: String,  completion: @escaping (Result<[CityModel], Error>) -> ()) {
         guard let url = URL(string: url) else { return }
         
         URLSession.shared.dataTask(with: url) { (data, responce, error) in
             DispatchQueue.main.async {
                 if let error = error {
                     completion(.failure(error))
                     return
                 }
                 guard let data = data else { return }
                 do {
                     let result = try JSONDecoder().decode([CityModel].self, from: data)
                     completion(.success(result))
                     
                 } catch let jsonError {
                     completion(.failure(jsonError))
                 }
             }
         }.resume()
     }
 
    func downloadImage(from imageID: String, completion: @escaping (Result<UIImage, Error>) -> ()) {
        print("Download Started")
        let baseImageURL = "http://openweathermap.org/img/wn/\(imageID)@2x.png"
        let url = URL(string: baseImageURL)
        URLSession.shared.dataTask(with: url!) { (data, responce, error) in
            
            DispatchQueue.main.async() { [] in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else { return }
                do {
                    guard let image = UIImage(data: data) else { return }
                    completion(.success(image))
                }
            }
        }.resume()
    }
    
    func getImage(fromID string: String) -> UIImage? {
         guard let url = URL(string: "http://openweathermap.org/img/wn/\(string)@2x.png") else { return nil }
         var image: UIImage? = nil
         do {
             let data = try Data(contentsOf: url, options: [])
             image = UIImage(data: data)
         }
         catch {
             print(error.localizedDescription)
         }

         return image
     }
}
