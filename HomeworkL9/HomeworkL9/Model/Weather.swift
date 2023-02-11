//
//  Weather.swift
//  HomeworkL9
//
//  Created by Hristo Papanov on 3.02.23.
//

import Foundation
import RealmSwift

class WeatherResult: Codable{
    var result: [WeatherSnapshot] = []
}

class WeatherSnapshot : Object, Codable{
    @Persisted(primaryKey: true) var id: String
    @Persisted var location: String
    @Persisted var rain: Int
    @Persisted var temperature: Double
    @Persisted var time: Int
    @Persisted var wind: Double
    @Persisted var windDirection: String
    @Persisted var createdAt: String
}

extension WeatherSnapshot{
    enum WindDirection: String{
        case north = "N"
        case northeast = "NE"
        case east = "E"
        case southeast = "SE"
        case south = "S"
        case southwest = "SW"
        case west = "W"
        case northwest = "NW"
        case unknownDirection = ""
    }
    
    var eWindDirection: WindDirection{
        return WindDirection(rawValue: self.windDirection) ?? .unknownDirection
    }
    
    var eTime: Date{
        return Date(timeIntervalSince1970: TimeInterval(self.time))
    }
}
