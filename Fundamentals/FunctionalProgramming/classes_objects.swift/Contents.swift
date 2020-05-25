// AUTHOR: Jonathan Phouminh
// Date: May 20th, 2020
// basic functionality practice for classes and objects, gonna do the employee example

import UIKit
import Foundation

/* Notes;
        Any constant or variable that refers to another object is automatically another pointer , there is no need for * and memory management is automatic
    just make sure you properly deinitialize everything or you will have memory leaks.
        
        Lazy Properties: these are property variables that are not actually calculated until the first time they are used.
            ex.    lazy var sorted_array = arr.sort()   // saves a whole of of time
 
        Mutating funcs vs funcs: remember that structures and enumerations are VALUE types so whenever you want to modify their properties via a function you need to have the mutating key word as opposed to classes which are reference types. Seems like class instances are more memory safe? s
 */
func SwiftExample1(){
    /* whenever you initialize a new struct or class they are a new 'type'
        Classes are REFERENCE TYPES
        Strcuts are static types
     */
    struct Resolution{
        var height: Int? = 0
        var width: Int? = 0
    }
    class VideoMode{
        var resolution: Resolution = Resolution()
        var interlaced: Bool = false
        var frameRate: Double = 0.0
        var name: String? = nil
    }

    let someResolution = Resolution()
    let someVideoMode = VideoMode()
    let vga = Resolution(height: 10, width: 100) // you can also automatically set them without having parameters in the struct

    print("The width of someResolution: \(someResolution.width!)")
}

/* working with lazy vars */
func SwiftExample2(){
    class DataImporter{
        let filename: String = "file.txt"
    }
    
    class DataManager{
        lazy var importer = DataImporter()
        var data = [String]()
    }
    
    let manager = DataManager()
    manager.data.append("Some data")
    manager.data.append("Some more data")
    
    print("Existing Data: \(manager.data)")
    print("Filename: \(manager.importer.filename)")
}

/* getter and setter methods */
func SwiftExample3(){
    struct Point{
        var xCoordinate: Double = 0
        var yCoordinate: Double = 0
    }
    struct Size{
        var width: Double = 0
        var height: Double = 0
    }
    struct Rect{
        var origin: Point = Point()
        var size = Size()
        /* don't have to actually use any memory here */
        var center: Point{
            get {
                let centerX = origin.xCoordinate + (size.width / 2)
                let centerY = origin.yCoordinate + (size.height / 2)
                return Point(xCoordinate:centerX, yCoordinate:centerY)
            }
            set(newCenter) {
                origin.xCoordinate = newCenter.xCoordinate - (size.width / 2)
                origin.yCoordinate = newCenter.yCoordinate - (size.height / 2)
            }
        }
    }
    
    var square = Rect(origin: Point(xCoordinate: 0.0, yCoordinate: 0.0), size: Size(width: 10.0, height: 10.0))
    let initialSquareCenter = square.center
    square.center = Point(xCoordinate: 15.0, yCoordinate: 15.0)
    print("square.origin is now at (\(square.origin.xCoordinate), \(square.origin.yCoordinate))")
}

/* Basic inheritance */
func SwiftExample4(){
    /* remember that class instances are reference types */
    class Vehicle{
        var model: String?
        init() {
            self.model = "Generic"
        }
        func description(){
            print("The model of this car is \(self.model!)")
        }
        func makeNoise(){
            print("A generic car makes the sound, honk")
        }
    }
    /* This subclass inherits everything from Vehicle and defines a new property "origin"*/
    class Audi: Vehicle{
        var origin: String?
        
        override init(){
            super.init()
            self.model = "S4"
        }
        convenience init(CarOrigin origin: String){
            self.init()            // calling the base initializer than setting everything to how we want for audis
            self.origin = origin
            
        }
        override func makeNoise() {
            print("Audi's make the noise. STUTSUTUU")
        }
    }
    
    class Subaru: Vehicle{
        var origin: String?
        override init(){
            super.init()
            self.model = "STI"
        }
        convenience init(CarOrigin origin: String){
            self.init()            // calling the base initializer than setting everything to how we want for audis
            self.origin = origin
        }
        override func makeNoise() {
            print("Audi's make the noise. BRAPBRAPBRAP")
        }
    }

    let s4 = Audi(CarOrigin: "Germany")
    s4.makeNoise()
    s4.description()
    
    let STI = Subaru(CarOrigin: "Japan")
    STI.makeNoise()
    STI.description()
}

/* Basics of Protocols
    * Essenetially, they are a certain set of instructions that an object has to abide by
        get , for what you need to know , it just says that you can set it as a constant or what not, it just has to be set
        set , the property CANNOT be a constant
 
 
    The purpose of using protocols is to ensure that your program can guarantee that all of them are alike based off of the protocol
 */

/* creating a protocol actually also creates a type for the conforming objects */
protocol CryptoCurrency{
    var name: String { get }
    var price: Double { get set }
    func showHistory()
    mutating func transfer()
    init(name: String)  // you have to give me a name
}
func SwiftExample5(){
    struct Bitcoin: CryptoCurrency {
        var name: String = "BTC"
        var price: Double = 10000
        
        init(name: String){
            self.name = name
        }
        
        func showHistory() {
            print("btc history")
        }
        
        mutating func transfer() {
            print("transferring btc")
        }
    }
    
    class Ethereum: CryptoCurrency{
        var name: String = "ETH"
        var price: Double = 100
        
        required init(name: String){
            self.name = name
        }
        
        func showHistory() {
            print("eth history")
        }
        
        /* don't have to put mutating because this is pass by reference */
        func transfer() {
            print("transfering eth")
        }
    }
    
    let btc = Bitcoin(name: "btc")
    let eth = Ethereum(name: "eth")
    let cryptoCurrencies: [CryptoCurrency] = [btc, eth]
}

/* protocol extensions */

protocol ColorChangable{
    
}
extension ColorChangable{
    func changeColor(newColor color: String){
        print("changing to \(color)")
    }
}
protocol TextClearable {
    
}
extension TextClearable{
    func clearText(){
        print("clearing text")
    }
}

// combining the protocols
protocol ColorAndTextChangable: ColorChangable, TextClearable{}

class myButton: ColorAndTextChangable{
    // Functionality that makes your button special
    
    // if we explicity define the same funciton, this will become the default not the one in the protocol extension
    func changeColor(newColor color: String) {
        print("THIS ONE")
    }
    
}


struct myLabel: ColorChangable{
    // Funcationality that makes your label special
}


class MyView: ColorChangable{
    
}

func SwiftExample6(){
    let btn = myButton()
    btn.changeColor(newColor: "red")
    btn.clearText()
}


/* optionals in protocols */
@objc protocol Savable{
    @objc optional var notes: String {get}
    func saveToDevice()
    @objc optional func eraseFromDevice()  // we want ot make this optional
}

class User: Savable{
    var notes: String = "some notes"
    
    func saveToDevice() {
        print("saving to device")
    }
    
    func eraseFromDevice() {
        print("erasing from device")
    }
}




func main(){
    //SwiftExample1()
    //SwiftExample2()
    //SwiftExample3()
    //SwiftExample4()
    //SwiftExample5()
    SwiftExample6()
}


main()
