//
//  WeatherManager.swift
//  URLSession_practice
//
//  Created by 안지훈 on 8/15/22.
//

import Foundation
import UIKit



enum APIError : Error {
    case wrongUrl
    case noData
    case decodingError
}

class WeatherManager {
    
    let cityName : String
    
    init(cityName : String){
        self.cityName = cityName
    }
    
    
    func getWeather(completion: @escaping (Result<Model, APIError>) -> Void) {
        
        print("weatherManager - getWeather called")
        // 섭씨온도로 가져오기
        let url = URL(string: API.BASE_URL + cityName + API.API_KEY + "&units=metric")
        
        guard let url = url else {
            return completion(.failure(.noData))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else {
                        return completion(.failure(.noData))
                    }
                    
                    let weatherResponse = try? JSONDecoder().decode(Model.self, from: data)
            debugPrint(weatherResponse ?? "")
                    // 성공했을때
                    if let weatherResponse = weatherResponse {
                        print(weatherResponse)
                        completion(.success(weatherResponse))
                    } else {
                        //print("error")
                        completion(.failure(.decodingError))
                    }
                }.resume()
        
        
    }
    
    
}
