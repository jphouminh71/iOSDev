import UIKit

/*: Decorator Pattern Implementation, from Head First Design Patterns Starbucks example */
protocol Beverage {  // using protocols as in place for an abstract class
    var description: String { get set }
    func getDescription() -> String
    func getCost() -> Double
}

protocol CondimentDecorator: Beverage {
    func getDescription() -> String
    func getCost() -> Double
}


/*: Creating the concrete classes for the drinks */
class Expresso: Beverage {
    var description: String = "Expresso"
    
    func getDescription() -> String {
        return self.description
    }
    
    func getCost() -> Double {
        return 1.99
    }
}

class HouseBlend: Beverage {
    var description: String = "HouseBlend"
    
    func getDescription() -> String {
        return self.description
    }
    
    func getCost() -> Double {
        return 1.99
    }
}

/*: Creating the decorator classes */
class Mocha: CondimentDecorator {
    
    /*: Needs a reference to the base beverage */
    var baseBeverage: Beverage
    var description: String = " + Mocha"
    
    init(_ base: Beverage) {
        baseBeverage = base
    }
    
    func getDescription() -> String {
        return baseBeverage.getDescription() + self.description
    }
    
    func getCost() -> Double {
        return baseBeverage.getCost() + 0.99
    }
}

class WhippedCream: CondimentDecorator {
    
    /*: Needs a reference to the base beverage*/
    var baseBeverage: Beverage
    var description: String = " + Whipped Cream"
    
    init(_ base: Beverage) {
        baseBeverage = base
    }
    
    func getDescription() -> String {
        return baseBeverage.getDescription() + self.description
    }
    
    func getCost() -> Double {
        return baseBeverage.getCost() + 0.99
    }
}

func main() {
    /*: Creating a house blend with whipped cream */
    var hb: Beverage = HouseBlend()
    hb = WhippedCream(hb)
    hb = Mocha(hb)

}
main()

