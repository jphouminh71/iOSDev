import UIKit

/*  Notes
        This is a very raw implementation of the observer function. It is incomplete only due to the reason that 
 
 
 */

/* 1. Inheritance in Swift */
// Just going to create a basic set of animals

class Animal {
    private
    
    // private variables
    var name: String
    var sound: String
    var AnimalType: String
    
    public
    
    // constructor
    init(name n: String, sound s: String) {
        self.name = n
        self.sound = s
        self.AnimalType = "Animal"
    }
    
    // getter method
    func getName() -> String {
        return self.name
    }
    func getSound() -> String {
        return self.sound
    }
    func getType() -> String {
        return self.AnimalType
    }
    
    // methods
    func makeNoise() {
        print("The \(self.AnimalType) makes the noise \(self.sound)")
        return
    }
    
    func sayName() {
        print("The \(self.AnimalType)'s name is ")
        return
    }
}


/* Canine class that inherits off of the Animal class */
class Canine: Animal {
    /* Only thing that actually changes is the Animal type */
    override init(name n: String, sound s: String) {
        super.init(name: n, sound: s)
        self.AnimalType = "Canine"
    }
    
    func bark() {
        print("\(self.getName()) the \(self.AnimalType) is barking")
    }
}

func inheritance () {
    // create the animal class
    let newAnimal: Canine = Canine(name: "Karen", sound: "Rawr")
    newAnimal.bark()
}


/* Observer Pattern */

// First we define the protocols that are going to be used by the observer / observable
protocol Observer {
    associatedtype Notification // generic
    func update( notif: Notification)
}
protocol Subject {
    associatedtype O: Observer
    mutating func attach(observer: O)
    mutating func detach(observer: O)
    func notifyObservers()
}

struct BidNotification {
    var bid: Float
    var message: String?
}

// Now we adopt these protocols in concrete classes
class Bidder: Observer {
    
    var id: Int {       // returns a unique id for the object
        return ObjectIdentifier(self).hashValue
    }
    
    func update(notif: BidNotification) {
        print("\(self.id) bidder has recieved the notification")
        print("The new bid is \(notif.bid). \(notif.message ?? "")")
    }
}

struct Auctioneer: Subject {
    private var reservePrice: Float = 0
    private var currentBid: Float = 0
    var bid: Float {
        set {
            currentBid = newValue
            notifyObservers()
        }
        get {
            return currentBid
        }
    }
    
    private var bidders: [Bidder] = [Bidder]()  // array of observers
    
    mutating func attach(observer: Bidder) {
        bidders.append(observer)
    }
    mutating func detach(observer: Bidder) {
        self.bidders = bidders.filter{ $0.id != observer.id}
    }
    
    func notifyObservers() {
        let message = bid > reservePrice ? "Reserve met, item sold" : nil
        let notification = BidNotification(bid: self.bid, message: message)
        print("did ya fix it")
        
        bidders.forEach{ $0.update(notif: notification)}
    }
    
}



func observer() {
    print("You are in the observer function")
    print("you just added this line")
}


func Menu() {
    //inheritance()
    observer()
}

Menu()
