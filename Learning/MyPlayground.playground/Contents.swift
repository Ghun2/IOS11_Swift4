//: Playground - noun: a place where people can play

import UIKit

//class Vehicle {
//    var currentSpeed = 0.0 // stored property
//    var description:String {
//        return "Traveling at \(currentSpeed) miles per hour"
//    }
//
//    func makeNoise() {
//        print("noiseless")
//    }
//}
//
//
//let someVehicle = Vehicle()
//
//someVehicle.currentSpeed = 1.0
//
//print(someVehicle.description)
//someVehicle.makeNoise()
//
//class Bicycle: Vehicle {
//    var hasBasket = false
//}
//
//
//let someBicycle = Bicycle()
//someBicycle.hasBasket = true
//someBicycle.currentSpeed = 15.0
//print(someBicycle.description)
//print(someBicycle.hasBasket)
//
//
//
//class Tandem:Bicycle {
//    var currentNumberOfPassengers = 0
//    override var description: String {
//        return "Traveling at \(currentSpeed) miles per hour, number of passenger : \(currentNumberOfPassengers)"
//    }
//}
//
//
//let someTandem = Tandem()
//someTandem.hasBasket = true
//someTandem.currentNumberOfPassengers = 2
//someTandem.currentSpeed = 22.0
//
//print(someTandem.description)
//
//
//class Train:Vehicle {
//    override func makeNoise() {
//        print("Choo Choo")
//    }
//}
//
//let someTrain = Train()
//someTrain.makeNoise()
//
//class Car:Vehicle {
//    var gear = 1
//
//    override init() {
//        print("Car")
//    }
//    init(newGear:Int) {
//        gear = newGear
//    }
//}
//
//let someCar = Car()
//let someCar2 = Car(newGear: 5)
//
//print(someCar2.gear)
//
//
//
//
//var name = ["Park","Choi","Kim","Lee"]
//var age = [3,4,5,6]
//var height = [40,50,60,70]
//
//
//
//struct Student {
//    var name:String
//    var age:Int
//    var height:Int
//}
//
//var student1 = Student(name: "Park", age: 3, height: 40)
//var student2 = Student(name: "Choi", age: 4, height: 50)
//
//print(student1.name,student1.age,student1.height)
//
//
//
//
//



let possibleNum = "123"
let convertedNum = Int(possibleNum)

print(convertedNum)

if convertedNum != nil {
    print(convertedNum!)
}

if let actualNum = Int(possibleNum) {
    print(actualNum)
}

var serverResponseCode:Int? = 404
serverResponseCode = nil
print(serverResponseCode)
















