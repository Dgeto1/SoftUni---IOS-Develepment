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

/*class MarketTrackerElement: Object, Codable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var symbol: String
    @Persisted var name: String
    @Persisted var image: String
    @Persisted var currentPrice: Double
    @Persisted var marketCap: Int
    @Persisted var marketCapRank: Int
    @Persisted var fullyDilutedValuation: Int?
    @Persisted var totalVolume: Double
    @Persisted var high24H: Double
    @Persisted var low24H: Double
    @Persisted var priceChange24H: Double
    @Persisted var priceChangePercentage24H: Double
    @Persisted var marketCapChange24H: Double
    @Persisted var marketCapChangePercentage24H: Double
    @Persisted var circulatingSupply: Double
    @Persisted var totalSupply: Double?
    @Persisted var maxSupply: Double?
    @Persisted var ath: Double
    @Persisted var athChangePercentage: Double
    @Persisted var athDate: String
    @Persisted var atl: Double
    @Persisted var atlChangePercentage: Double
    @Persisted var atlDate: String
    @Persisted var roi: Roi?
    @Persisted var lastUpdated: String
    @Persisted var sparklineIn7D: SparklineIn7D?
    @Persisted var priceChangePercentage24HInCurrency: Double
}

class Roi: Object, Codable {
    @Persisted(primaryKey: true) var id: ObjectId?
    @Persisted var times: Double
    @Persisted var currency: String
    @Persisted var percentage: Double
}

class SparklineIn7D: Object, Codable {
    @Persisted(primaryKey: true) var id: ObjectId?
    @Persisted var price: List<Double>
}*/


