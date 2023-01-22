//
//  RequestManager.swift
//  HomeworkL7
//
//  Created by Hristo Papanov on 21.01.23.
//

import Foundation

class NYRequestManager{
    static let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=40.71&longitude=-74.01&current_weather=true")
    
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
            guard let data = data, let weatherNY = try? JSONDecoder().decode(Weather.self, from: data)
            else{
                return
            }
            print(weatherNY)
            NYRequestManager.temperature = weatherNY.current_weather.temperature
            NYRequestManager.elevation = weatherNY.elevation
            NYRequestManager.winddirection = weatherNY.current_weather.winddirection
            NYRequestManager.windspeed = weatherNY.current_weather.windspeed
            NYRequestManager.time = weatherNY.current_weather.time
            NYRequestManager.generationtime_ms = weatherNY.generationtime_ms
            
            NYRequestManager.weatherCode = weatherNY.current_weather.weathercode
        })
        task.resume()
    }
}
