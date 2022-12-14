import UIKit

let team1Card = ["A", "10", "8", "7", "Q", "K"]
let team2Card = ["J", "J", "A", "9"]

func calculateScore(cardsForTeam: [String])-> Int{
    var score = 0;
    
    for aCard in cardsForTeam{
        score+=getScorePerCard(card: aCard)
    }
    return score
}

func getScorePerCard(card: String) -> Int{
    switch card{
    case "A":
        return 11
    case "10":
        return 10
    case "8", "7":
        return 0
    case "Q":
        return 3
    case "K":
        return 4
    case "J":
        return 20
    case "9":
        return 14
    default:
        return 0
    }
}
print("Team one - \(calculateScore(cardsForTeam: team1Card)), team two - \(calculateScore(cardsForTeam: team2Card))")
