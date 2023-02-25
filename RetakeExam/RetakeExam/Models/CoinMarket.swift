//
//  CoinMarket.swift
//  RetakeExam
//
//  Created by Hristo Papanov on 12.02.23.
//

import Foundation
import RealmSwift

class MarketList: Codable {
    var result:  [MarketTrackerElement] = []
}

class MarketTrackerElement: Object, Codable{
    @Persisted(primaryKey: true) var id: String
    @Persisted var symbol: String
    @Persisted var name: String
    @Persisted var image: String
    @Persisted var currentPrice: Double
    @Persisted var marketCap: Int
    @Persisted var totalVolume: Double
    @Persisted var high24H: Double
    @Persisted var low24H: Double
    @Persisted var priceChange24H: Double
}


