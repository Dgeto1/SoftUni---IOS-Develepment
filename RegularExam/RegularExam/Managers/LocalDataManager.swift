//
//  LocalDataManager.swift
//  RegularExam
//
//  Created by Hristo Papanov on 5.02.23.
//

import Foundation
import RealmSwift
import Realm

class LocalDataData {
    static let userDefaults = UserDefaults.standard
    
    static var myData: Double?{
        set{
            userDefaults.set(newValue, forKey: "MyData")
            userDefaults.synchronize()
        }
        
        get{
            userDefaults.object(forKey: "MyData") as? Double
        }
    }
}

class LocalDataManager{
    static let realm = try! Realm(configuration: realmConfig)
    
    class func dropDatabase(){
        try? realm.write{
            realm.deleteAll()
        }
    }
    static var realmConfig: Realm.Configuration{
        var config = Realm.Configuration()
        config.deleteRealmIfMigrationNeeded = true
        config.schemaVersion = 1
        return config
    }
    
    class func allBlockChainData(){
        let allBlockChainData = LocalDataManager.realm.objects(BlockChain.self)
    }
    
    static func getBlockChainData() -> [BlockChain] {
        return Array(LocalDataManager.realm.objects(BlockChain.self).sorted(byKeyPath: "buildTime", ascending: false))
    }
    
    /*static let realm = try! Realm()
    
    static func updateBlockbookData() {
        RequestManager.fetchData()
        RequestManager.fetchData { error, result in
            guard error == nil else {
                print("Error in fetching data")
                return
            }
            
            guard let result = result else {
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
    
    static func getBlokbookData() -> [BlockbookSnapshot] {
        return Array(LocalDataManager.realm.objects(BlockbookSnapshot.self).sorted(byKeyPath: "buildTime", ascending: false))
    }*/
}

