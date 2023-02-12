//
//  RequestManager.swift
//  RetakeExam
//
//  Created by Hristo Papanov on 12.02.23.
//

import Foundation
import Alamofire
import RealmSwift

class RequestManager{
    static func fetchData(completion: @escaping((_ error: String?, _ result: [MarketTrackerElement]?) -> Void)) {
        
        AF.request("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h", method: .get).responseDecodable(of: [MarketTrackerElement].self) { (marketTrackerElementResponse) in
            
            guard marketTrackerElementResponse.error == nil else{
                completion(marketTrackerElementResponse.error? .localizedDescription, nil)
                return
            }
            
            guard let responseValue = marketTrackerElementResponse.value else{
                completion("No valid response", nil)
                return
            }
            //responseValue.roi?.id = ObjectId.generate()
            //responseValue.sparklineIn7D?.id = ObjectId.generate()
            completion(nil, responseValue)
            
        }
        //print(completion)
    }
}
