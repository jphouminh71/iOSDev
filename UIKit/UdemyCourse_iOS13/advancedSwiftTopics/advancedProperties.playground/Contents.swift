// AUTHOR: Jonathan Phouminh
// Date: June 23rd, 2020
// Advanced Swift Properties notes from

import UIKit

func anonymousFunctions(){
    // function takes in arithmetic functions as a parameter , just integers for now
    
    func arithmetic(a: Int, b: Int, f: (Int,Int) -> Int) -> (){
        print( f(a,b))
    }
    arithmetic(a: 5, b: 5, f: {(x,y) in x + y})
}



func advancedSwiftProperties() -> (){
    let pizzaInInches: Int = 10   // stored property
    var numberOfPeople: Int = 12
    let slicesPerPerson = 4
    var numberOfSlices: Int {
        get{
            return pizzaInInches - 4
        }
    }
    var numberOfPizza: Int{
        get{
            let numberOfPeopleFedPerPizza = numberOfSlices / numberOfSlices
            return numberOfPeople / numberOfPeopleFedPerPizza
        }
        set{
            let totalSlices = numberOfSlices * newValue  // new value is the value that this property got set too.
            numberOfPeople = totalSlices / slicesPerPerson
        }
    }
    
    numberOfPizza = 4
    print(numberOfPeople)
}

func observedProperties() -> (){
    
    var pizzaInInches: Int = 10 {
        willSet{
            print("The new value will be: \(newValue)")
        }
        didSet{
            if (pizzaInInches >= 18){   // the value is the new one that just got set (newValue)
                print("Invalid size specified, pizzaInInches is set to 18.")
                pizzaInInches = 18
            }
        }
    }
    var numberOfPeople: Int = 12
    let slicesPerPerson = 4
    var numberOfSlices: Int {
        get{
            return pizzaInInches - 4
        }
    }
    var numberOfPizza: Int{
        get{
            let numberOfPeopleFedPerPizza = numberOfSlices / numberOfSlices
            return numberOfPeople / numberOfPeopleFedPerPizza
        }
        set{
            let totalSlices = numberOfSlices * newValue  // new value is the value that this property got set too.
            numberOfPeople = totalSlices / slicesPerPerson
        }
    }
    
    pizzaInInches = 20
    
}

func computedPropertyChallenge() -> (){
    ///* The challenge is to figure out how many buckets are required for the given wall, a single bucket of paint covers 1.5m^2.
    ///* If you set a bucket of paint, print how area can be covered in x^2 meters
    var width: Float = 1.5
    var height: Float = 2.3
    
    var bucketsOfPaint: Int{
        get{
            var value = Int(ceilf((width * height) / 1.5))
            print("number of buckets needed is \(value)")
            return value
        }
        set{
            let areaCanCover = Double(newValue) * 1.5
            print("This amount of paint can cover an area of \(areaCanCover)")
        }
    }
    
    
    bucketsOfPaint = 5
    print(bucketsOfPaint)
}






func main() -> (){
    //anonymousFunctions()
    //advancedSwiftProperties()
    //observedProperties()
    computedPropertyChallenge()
}
main()
