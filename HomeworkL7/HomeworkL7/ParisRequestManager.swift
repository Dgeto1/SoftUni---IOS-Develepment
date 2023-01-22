//
//  RequestManager.swift
//  HomeworkL7
//
//  Created by Hristo Papanov on 21.01.23.
//

import Foundation

class ParisRequestManager{
    static let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=48.85&longitude=2.35&current_weather=true")
    
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
            guard let data = data, let weatherP = try? JSONDecoder().decode(WeatherP.self, from: data)
            else{
                return
            }
            print(weatherP)
            ParisRequestManager.temperature = weatherP.current_weather.temperature
            ParisRequestManager.elevation = weatherP.elevation
            ParisRequestManager.winddirection = weatherP.current_weather.winddirection
            ParisRequestManager.windspeed = weatherP.current_weather.windspeed
            ParisRequestManager.time = weatherP.current_weather.time
            ParisRequestManager.generationtime_ms = weatherP.generationtime_ms
            
            ParisRequestManager.weatherCode = weatherP.current_weather.weathercode
        })
        task.resume()
    }
}
