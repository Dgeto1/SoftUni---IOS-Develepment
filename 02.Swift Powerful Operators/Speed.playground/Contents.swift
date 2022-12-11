import UIKit

func AverageSpeed(tripLength: Double, tripDuration: Double) -> Double{
    let avgSpeedKPH = tripLength/tripDuration
    return avgSpeedKPH
}

func ConvertKPHtoMPS(kph : Double) -> Double{
    let result = kph*1000/3600.0
    return result
}

let durationHours = 3.0
let durationMins = 36.0
let distanceKm = 371.0

let totalDuration = durationHours+durationMins/60
let resultKm = AverageSpeed(tripLength: distanceKm, tripDuration: totalDuration)
let resultMPS = ConvertKPHtoMPS(kph: resultKm)

let resultStringKPH = String(format: "%0.2f", resultKm)
print("V(kph) = \(resultStringKPH)")
let resultStringMPS = String(format: "%0.2f", resultMPS)
print("V(mph) = \(resultStringMPS)")

