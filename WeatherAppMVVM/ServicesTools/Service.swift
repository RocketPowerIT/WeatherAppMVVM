//
//  Service.swift
//  WeatherAppMVVM
//
//  Created by wolfyteze on 23/03/2021.
//  Copyright © 2021 wolfyteze. All rights reserved.
//

import Foundation
import UIKit

struct Service {
    
    typealias ResultBlock<T> = (Result <T, Error>) -> Void
    private let utilityQueue = DispatchQueue.global(qos: .utility)
    
    static func startFetch<T: Decodable>(of type: T.Type,
                                         from data: Data,
                                         completion: @escaping ResultBlock<T>){
        
        do {
            let decodedData: T = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        }
            
        catch let jsonError {
            completion(.failure(jsonError))
        }
    }
    
   static func getImage(fromID string: String) -> UIImage? {
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
    
    static func getCity(from cityName: String){
        
    }
    
    


//    static func loadImage(idImage: String, completion: @escaping (UIImage?) -> ()) {
//        utilityQueue.async {
//            let url = URL(string: "http://openweathermap.org/img/wn/\(idImage)@2x.png")!
//
//            guard let data = try? Data(contentsOf: url) else { return }
//            let image = UIImage(data: data)
//
//            DispatchQueue.main.async {
//                completion(image)
//            }
//        }
//    }
}
//    static func fetchMVVMData(_ completion: @escaping (Result<[MVVMModel], Error>) -> () ){
//        completion(.success(mvvmData))
//
//    }
    
    
  
//
//let mvvmData = [
//    MVVMModel(city: "City1", id: 1000),
//    MVVMModel(city: "City2", id: 2000),
//    MVVMModel(city: "City3", id: 3000)
//]
