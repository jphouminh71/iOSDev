import UIKit

/*: This is a simple factory method , the goal is to get the instantion away */

/* Creating a interface for all pizzas */
protocol Pizza {
    var type: String {get set}
    func prepare()
    func bake()
    func cut()
    func box()
}

/* providing some default implementations, since you are doing this here, you don't have to implement them to conforming classes */
extension Pizza {
    func prepare() {
        print("Preparing a \(self.type)")
    }
    func bake(){
        print("Baking a \(self.type)")
    }
    func cut(){
        print("Cutting a \(self.type)")
    }
    func box(){
        print("Boxing a \(self.type)")
    }
}

/* Creating the different concrete pizza classes */
class CheesePizza: Pizza {
    var type: String = "Cheese Pizza"
    
    /* DONT DO THIS IF YOU HAVE PREDEFINED IMPLEMENTATIONS, its essentially overriding */
//    func prepare(_ pizzaName: String) {
//        print("in this prepare function")
//        prepare(self.type)
//    }
}

class VeggiePizza: Pizza {
    var type: String = "Veggie Pizza"
}

class PepperoniPizza: Pizza {
    var type: String = "Pepperoni Pizza"
}

/* Creating the basic factory */
/* For classes that need this you would need to create a reference to this class */
/* Wouldn't be a bad idea to possibly have this as a singleton, but not neccessary if you don't abuse it */
class SimplePizzaFactory {
    
    /* Function takes in a string and returns the pizza accordingly*/
    func createPizza(_ name: String) -> Pizza? {
        switch name {
        case "Cheese Pizza":
            return CheesePizza()
        case "Veggie Pizza":
            return VeggiePizza()
        case "Pepperoni Pizza":
            return PepperoniPizza()
        default:
            print("No such pizza called \(name)")
            return nil
        }
    }
}


func main(){
    
    let pizzaFactory: SimplePizzaFactory = SimplePizzaFactory()
    let vg: VeggiePizza? = pizzaFactory.createPizza("Veggie Pizza") as? VeggiePizza  /* just an example force downcasting to the specific type we want */
    
    /* unwrap the optional */
    if let veg = vg {
        veg.prepare()
        veg.bake()
        veg.cut()
        veg.box()
    }
}
main()

