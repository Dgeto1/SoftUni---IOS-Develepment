//
//  Data.swift
//  HomeworkL7
//
//  Created by Hristo Papanov on 21.01.23.
//

import Foundation

enum Keys{
    case name, condition
}

let conditions:[[Keys: String]] = [[.name: "Температура",      .condition:String(RequestManager.temperature)],
                                [.name: "Атмосферно налягане", .condition: String(RequestManager.elevation)],
                                [.name: "Посока на вятъра", .condition:String(RequestManager.winddirection)],
                                [.name: "Скорост на вятъра", .condition:String(RequestManager.windspeed)],
                                [.name: "Видимост", .condition:String(RequestManager.generationtime_ms)],
                                [.name: "Последен ъпдейт на данните", .condition:String(RequestManager.time)]]
