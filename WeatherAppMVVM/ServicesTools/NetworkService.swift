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
    
    func parseJSON(url: String,  completion: @escaping (Result<WeatherDataModel, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let result = try JSONDecoder().decode(WeatherDataModel.self, from: data)
                    completion(.success(result))
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
//    
//
//    
//    func downloadImage(from imageID: String, completion: @escaping (Result<UIImage, Error>) -> ()) {
//        print("Download Started")
//        let baseImageURL = "http://openweathermap.org/img/wn/\(imageID)@2x.png"
//        let url = URL(string: baseImageURL)
//        URLSession.shared.dataTask(with: url!) { (data, responce, error) in
//            
//            DispatchQueue.main.async() { [] in
//                if let error = error {
//                    completion(.failure(error))
//                    return
//                }
//                
//                guard let data = data else { return }
//                do {
//                    guard let image = UIImage(data: data) else { return }
//                    completion(.success(image))
//                }
//            }
//        }.resume()
//    }
//    func fetchCity(url: URL){
//    URLSession.shared.dataTask(with: url) { (data, response, error) in
//        if let response = response as? HTTPURLResponse {
//            if let encoding = response.allHeaderFields["Content-Encoding"] as? String {
//                print(encoding)
//                print(encoding == "gzip")
//            }
//        }
//    }.resume()
//          }
}
