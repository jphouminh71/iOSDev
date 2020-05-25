// AUTHOR: Jonathan Phouminh
// Date: May 25th, 2020
// recreating code from week 14 notebook
import UIKit

/* Inheritance: Super calls */
class A {
    func foo(){
        print("From A: Base Class")
    }
}

class B: A{
    override func foo(){
        print("From B: Subclass")
    }
}


func callFoo(_ a: A) -> (){
    a.foo()
}

let b = B()
//callFoo(b)  // because of dynamic dispatch, this prints "From B: Subclass"

/* Since swift doesn't have abstract classes, the best thing to do is to take advantage of protocols and protocol extensions */
// use these protocols so that you can instantly apply methods to classes/structs/enums really quickly (refactoring)
protocol Philosophical{}
extension Philosophical{
    func philosophize(){
        print("I take up space , therfore I am!")
    }
}
protocol Green{}
extension Green{
    func color() -> String{
        return "green"
    }
}

class Frog: Philosophical, Green{
    let name: String?
    init(frogName named: String) {
        self.name = named
    }
    func printName() -> (){
        print("My name is \(self.name!)")
    }
}

let frogger = Frog(frogName: "Frogger")
frogger.printName()
frogger.philosophize()

protocol Animal{}
protocol Color{
    var color: String {get}
}
extension Color{
    func getColor() -> String{
        return color
    }
}
/* This class is a subclass of Animal that conforms to being philosophical and Color */
class GreenFrog: Animal, Philosophical, Color{
    let name: String
    var color: String   // need to define this because its part of the inhertied protocol
    init(isNamed name: String, isColored color: String) {
        self.name = name
        self.color = color
    }
}

let greenFrog = GreenFrog(isNamed: "GreenFrogger", isColored: "Green")
greenFrog.getColor()



