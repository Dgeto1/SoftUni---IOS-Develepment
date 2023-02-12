import Foundation
import RealmSwift
 
class Blockbook: Object, Codable {
    @Persisted(primaryKey: true) var id: ObjectId?
    @Persisted var coin: String
    @Persisted var host: String
    @Persisted var version: String
    @Persisted var gitCommit: String
    @Persisted var buildTime: String
    @Persisted var syncMode: Bool
    @Persisted var initialSync: Bool
    @Persisted var inSync: Bool
    @Persisted var bestHeight: Int
    @Persisted var lastBlockTime: String
    @Persisted var inSyncMempool: Bool
    @Persisted var lastMempoolTime: String
    @Persisted var mempoolSize: Int
    @Persisted var decimals: Int
    @Persisted var dbSize: Int
    @Persisted var about: String
}
 
class Backend: Object, Codable {
    @Persisted(primaryKey: true) var id: ObjectId?
    @Persisted var chain: String
    @Persisted var blocks: Int
    @Persisted var headers: Int
    @Persisted var bestBlockHash: String
    @Persisted var difficulty: String
    @Persisted var sizeOnDisk: Int
    @Persisted var version: String
    @Persisted var subversion: String
    @Persisted var protocolVersion: String
}
 
class BlockChain: Object, Codable {
    @Persisted(primaryKey: true) var id: ObjectId?
    @Persisted var blockbook: Blockbook?
    @Persisted var backend: Backend?
}
 
class BlockChainList: Codable {
    var result: [BlockChain] = []
}
