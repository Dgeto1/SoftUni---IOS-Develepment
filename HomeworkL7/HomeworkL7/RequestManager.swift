//
//  RequestManager.swift
//  HomeworkL7
//
//  Created by Hristo Papanov on 21.01.23.
//

import Foundation

class RequestManager{
    static let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=42.70&longitude=23.32&current_weather=true")
    
    static var temperature: Double = 0.0
    static var elevation: Double = 0.0 //nadmorska vis
    static var winddirection: Double = 0.0
    static var windspeed: Double = 0.0
    static var time: String = ""
    static var generationtime_ms: Double = 0.0 //vidimost
    
    static var weatherCode: Double = 0.0
    
    class func fetchData(){
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let data = data, let weather = try? JSONDecoder().decode(Weather.self, from: data)
            else{
                return
            }
            print(weather)
            RequestManager.temperature = weather.current_weather.temperature
            RequestManager.elevation = weather.elevation
            RequestManager.winddirection = weather.current_weather.winddirection
            RequestManager.windspeed = weather.current_weather.windspeed
            RequestManager.time = weather.current_weather.time
            RequestManager.generationtime_ms = weather.generationtime_ms
            
            RequestManager.weatherCode = weather.current_weather.weathercode
        })
        task.resume()
    }
}
