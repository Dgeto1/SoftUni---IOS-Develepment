import UIKit

enum Currency{
    case BGN
    case EUR
    case USD
}

struct ATM{
    var id: String
    var currentValue: [String: Int]
    var percentageFee: Double
}

struct Card{
    var id: String
    var owner: String
    var currentValue: [String: Int]
}


//Can't do the function :(
