import UIKit

enum Currency: String {
    case BGN = "BGN"
    case USD = "USD"
    case EUR = "EUR"
    
    var rateToBGN: Double {
        switch self {
        case .BGN:
            return 1
        case .EUR:
            return 1.956
        case .USD:
            return 1.858
        }
    }
    
    func convertToBGN(amount: Double, currencyFeeInPercent: Double) -> Double {
        switch self {
        case .BGN:
            return amount
        case .EUR, .USD:
            return amount*(self.rateToBGN/(1+currencyFeeInPercent/100))
        }
    }
    
    func convertToEUR(amount: Double, currencyFeeInPercent: Double) -> Double {
        switch self {
        case .EUR:
            return amount
        case .BGN:
            return amount/(Currency.EUR.rateToBGN/(1+currencyFeeInPercent/100))
        case .USD:
            return amount/(Currency.USD.rateToBGN/Currency.EUR.rateToBGN/(1+currencyFeeInPercent/100))
        }
    }
    
    func convertToUSD(amount: Double, currencyFeeInPercent: Double) -> Double {
        switch self {
        case .USD:
            return amount
        case .BGN:
            return amount/(Currency.USD.rateToBGN/(1+currencyFeeInPercent/100))
        case .EUR:
            return amount/(Currency.EUR.rateToBGN/Currency.USD.rateToBGN/(1+currencyFeeInPercent/100))
        }
    }
}

struct Card {
    var owner: String
    var cardAccounts: [Currency: Double]
    
    func printCardBalance() {
        self.cardAccounts.forEach({
            print("Card balance \($0.key.rawValue):\($0.value)")
        })
    }
    
    ///Used to see which is going to be the currency for withdraw. If none of the balances is enough - it will return nil
    func getCurrencyToWithdraw(amount: Double, fee: Double) -> (currency: Currency?, amount: Double) {
        if amount <= self.cardAccounts[.BGN]! {
            return (.BGN, amount)
        } else if Currency.BGN.convertToEUR(amount: amount, currencyFeeInPercent: fee) <= self.cardAccounts[.EUR]! {
            return (.EUR, Currency.BGN.convertToEUR(amount: amount, currencyFeeInPercent: fee))
        } else if Currency.BGN.convertToUSD(amount: amount, currencyFeeInPercent: fee) <= self.cardAccounts[.USD]! {
            return (.USD, Currency.BGN.convertToUSD(amount: amount, currencyFeeInPercent: fee))
        } else {
            return (nil, 0)
        }
    }
    
    ///Withdraw function returns success if the withdraw is successful and false if it's not
    mutating func withdraw(amount: Double, currency: Currency) -> Bool {
        //safety to be sure that we have balance of that currency
        guard let currentBalanceForCurrency = self.cardAccounts[currency] else {
            return false
        }
        
        guard currentBalanceForCurrency >= amount else {
            return false
        }
        
        let finalBalance = currentBalanceForCurrency - amount
        self.cardAccounts[currency] = finalBalance
        return true
    }
}

struct ATM {
    var id: String
    var availabilityАТМ: [Currency: Double]
    var currencyFee: Double = 2
    
    mutating func withdrawing(card: Card, amount: Double) -> Card? {
         
        var aCard = card
        let currencyAndAmountToWithdraw = aCard.getCurrencyToWithdraw(amount: amount, fee: currencyFee)
        guard let withdrawCurrency = currencyAndAmountToWithdraw.currency else {
            print("Недостатъчна наличност по вашата сметка")
            return nil
        }
        
        guard var atmAvailability = availabilityАТМ[.BGN], atmAvailability >= amount else {
            print("Недостатъчна наличност в банкомата")
            return nil
        }
        
        guard aCard.withdraw(amount: currencyAndAmountToWithdraw.amount, currency: withdrawCurrency) == true else {
            print("Недостатъчна наличност по вашата сметка")
            return nil
        }
        
        atmAvailability -= amount
        self.availabilityАТМ[.BGN] = atmAvailability
        
        return aCard
    }
    
    func printATMBalance() {
        self.availabilityАТМ.forEach({print("ATM Balance: \($0.key.rawValue):\($0.value)")})
    }
}

var atm = ATM(id: "1312", availabilityАТМ: [.USD: 0,.BGN: 20.0,.EUR: 0.0], currencyFee: 2.0)
var card = Card(owner: "Somebody", cardAccounts: [.USD: 0.0, .EUR: 0.0, .BGN: 80.0])

// Example 1
print("Example 1")

if let result = atm.withdrawing(card: card, amount: 20.0) {
    card = result
}

atm.printATMBalance()
card.printCardBalance()

// Example 2
print("Example 2")
atm.availabilityАТМ[Currency.BGN] = 100.0
card.cardAccounts = [Currency.USD: 0.0, Currency.EUR: 0.0, Currency.BGN: 80.0]

if let result = atm.withdrawing(card: card, amount: 80.0) {
    card = result
}

atm.printATMBalance()
card.printCardBalance()

// Example 3
print("Example 3")
atm.availabilityАТМ[Currency.BGN] = 100.0
card.cardAccounts = [Currency.USD: 0.0, Currency.EUR: 0.0, Currency.BGN: 80.0]

if let result = atm.withdrawing(card: card, amount: 90.0) {
    card = result
}

atm.printATMBalance()
card.printCardBalance()

// Example 4
print("Example 4")
atm.availabilityАТМ[Currency.BGN] = 60.0
card.cardAccounts = [Currency.USD: 0.0, Currency.EUR: 0.0, Currency.BGN: 80.0]

if let result = atm.withdrawing(card: card, amount: 80.0) {
    card = result
}

atm.printATMBalance()
card.printCardBalance()

// Example 5
print("Example 5")
atm.availabilityАТМ[Currency.BGN] = 100.0
card.cardAccounts = [Currency.USD: 0.0, Currency.EUR: 60.0, Currency.BGN: 80.0]

if let result = atm.withdrawing(card: card, amount: 100.0) {
    card = result
}

atm.printATMBalance()
card.printCardBalance()

// Example 6
print("Example 6")
atm.availabilityАТМ[Currency.BGN] = 400.0
card.cardAccounts = [Currency.USD: 0.0, Currency.EUR: 60.0, Currency.BGN: 80.0]

if let result = atm.withdrawing(card: card, amount: 150.0) {
    card = result
}

atm.printATMBalance()
card.printCardBalance()
