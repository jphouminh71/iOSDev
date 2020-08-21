import UIKit


class Parent {
    var name: String?
    func printAge() {
        print("im 30")
    }
}

class Child : Parent {
    var favoriteActivity: String?   // remember , this subclass also inherits the 'name' attribute
    override func printAge() {
        print("im 10")
    }
}

class ChildOfChild: Child {
    
}




func stripText() {
    var str1 = "ActionLabel"
    var str2 = "ButtonLabel"
    let index = str1.index(str1.endIndex, offsetBy: -5)
    
    
    let str3 = String(str2.substring(to: index ))
    print(str3)
}




func main() {
//    let comp = "button"
//    let t1 = "ActionButton"
//
//    switch t1 {
//    case let buttonComponent where t1.contains("utton"):
//        print(buttonComponent)
//    default:
//        print("nope")
//    }
//    let mom = Parent()
//    let child = Child()
//    let child2 = ChildOfChild()
//
//    if child2 is Parent {  // this is how you check downcasted objects for their types
//        print("child2 is a subclass of mom")
//    } else {
//        print("its not")
//    }
    stripText()
}
main()
