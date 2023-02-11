//
//  RequestManager.swift
//  HomeworkL9
//
//  Created by Hristo Papanov on 3.02.23.
//

import Foundation
import Alamofire

class RequestManager{
    let url = "https://api.open-meteo.com/v1/forecast?latitude=42.70&longitude=23.42&current_weather=true"
    
    func getWeatherData(completion: @escaping (Result<WeatherSnapshot, Error>) -> Void) {
        AF.request(url, method: .get).responseDecodable(of: WeatherSnapshot.self) { (response: AFDataResponse<WeatherSnapshot>) in
            switch response.result {
            case .success(let weatherapp):
                completion(.success(weatherapp))
                print(response.result)
            case .failure(let error):
                completion(.failure(error))
                print("can't fetch data!")
            }
        }
    }
}
