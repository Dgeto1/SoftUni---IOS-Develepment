//
//  Data.swift
//  HomeworkL7
//
//  Created by Hristo Papanov on 21.01.23.
//

import Foundation

enum ParisKeys{
    case name, condition
}

let conditionsParis:[[ParisKeys: String]] = [[.name: "Температура",      .condition:String(ParisRequestManager.temperature)],
                                [.name: "Атмосферно налягане", .condition: String(ParisRequestManager.elevation)],
                                [.name: "Посока на вятъра", .condition:String(ParisRequestManager.winddirection)],
                                [.name: "Скорост на вятъра", .condition:String(ParisRequestManager.windspeed)],
                                   [.name: "Видимост", .condition:String(ParisRequestManager.generationtime_ms)],
                                [.name: "Последен ъпдейт на данните", .condition:String(ParisRequestManager.time)]]
