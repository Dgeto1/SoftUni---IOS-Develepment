//
//  LocalDataManager.swift
//  RetakeExam
//
//  Created by Hristo Papanov on 12.02.23.
//

import Foundation
import RealmSwift

class LocalDataManager{
    static let realm = try! Realm()
    
    static func updateMarketData() {
        RequestManager.fetchData { error, result in
            guard error == nil else{
                print("Error in fetching data")
                return
            }
            
            guard let result = result else{
                print("Cannot parse data")
                return
            }
            
            DispatchQueue.main.async {
                LocalDataManager.realm.beginWrite()
                LocalDataManager.realm.add(result, update: .all)
                
                try? LocalDataManager.realm.commitWrite()
                NotificationCenter.default.post(name: .dataUpdatedNotification, object: nil)
            }
        }
    }
    static func getMarketData() -> [MarketTrackerElement] {
        return Array(LocalDataManager.realm.objects(MarketTrackerElement.self))
                     }
}
