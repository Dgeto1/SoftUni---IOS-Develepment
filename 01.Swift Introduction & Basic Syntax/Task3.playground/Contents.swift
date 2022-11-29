import UIKit

struct Car {
    let make: String
    let model: String
    let horsePower: Double
    let torque: Float
    let dateOfManufacturing: String
    
    func PowerOfTheCar(car: Car) -> Double{
        let powwrInWatt = car.horsePower * 745.699872
        return powwrInWatt
    }
}

let car1 = Car(make: "Mercedes", model: "S63", horsePower: 500, torque: 55.5, dateOfManufacturing: "25.11.2022")
print(car1)
print(car1.PowerOfTheCar(car: car1  ))

