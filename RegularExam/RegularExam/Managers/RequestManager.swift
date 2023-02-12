

import Foundation
import Alamofire
import RealmSwift
 
class RequestManager {
        static func fetchData(completion: @escaping((_ error: String?, _ result: [BlockChain]?) -> Void)) {
            
            AF.request("https://btc.explorer.changex.io/api/", method: .get).responseDecodable(of: BlockChain.self) { (blockChainDataReseponce) in
                
                guard blockChainDataReseponce.error == nil else {
                    completion(blockChainDataReseponce.error? .localizedDescription, nil)
                    return
                }
                
                guard let responseValue = blockChainDataReseponce.value else {
                    completion("No valid response", nil)
                    return
                }
                responseValue.blockbook?.id = ObjectId.generate()
                responseValue.backend?.id = ObjectId.generate()
                responseValue.id = ObjectId.generate()
//                completion(nil, responseValue.realm?.add(<#T##object: Object##Object#>))
                
               /* DispatchQueue.main.async {
                    try? LocalDataManager.realm.write {
                        LocalDataManager.realm.delete(LocalDataManager.allBlockChainData())
                    }
                }
                
                DispatchQueue.main.async {
                    try? LocalDataManager.realm.write {
                        LocalDataManager.realm.add(responseValue)
                    }
                    NotificationCenter.default.post(name: .dataUpdateNotification, object: nil)
                }*/
//                print(completion)
            }
        }
}

