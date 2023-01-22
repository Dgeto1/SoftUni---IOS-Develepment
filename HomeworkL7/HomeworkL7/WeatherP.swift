//
//  Weather.swift
//  HomeworkL7
//
//  Created by Hristo Papanov on 21.01.23.
//

import Foundation

struct CurrentWeatherP: Codable{
    var temperature: Double
    var time: String
    var weathercode: Double
    var winddirection: Double
    var windspeed: Double
}

struct WeatherP: Codable{
    var elevation: Double
    var latitude: Double
    var longitude: Double
    var timezone: String
    var timezone_abbreviation: String
    var utc_offset_seconds: Int
    var generationtime_ms: Double
    var current_weather: CurrentWeatherP
}
