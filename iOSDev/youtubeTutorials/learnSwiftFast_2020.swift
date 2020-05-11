// Author: Jonathan Phouminh
// March 27th, 2020
// Basics of swift

/*
    Lesson One
        Variables:
                    Syntax: var _ : <DataType> = <assigment>
            * similar to scala, but remember that these are VARIABLES so they are mutable. *
        Constant:
                    Syntax: let _ : <DataType> = <assignment>
            * This is alias to VAL in scala *
 
            When do you want to switch between the two? Constants are good to use when you want to keep track of a piece of data that you never plan on changing.
 
        When you go through these lessons, just wrap them all inside of functions themselves because the playground, as far as you know, won't let you run partial sets of lines at a time
 */
import UIKit

func lessonOne(){
    var str = "Hello World"
    print(str)

    123
    0.7
    "Hello"

    // declaring variables
    var firstName : String = "Jonathan Phouminh"
    var stockPrice : Int = 100
    stockPrice = 20
    print(stockPrice)


    /* It says online that swift is statically typed, I guess this is wierd because you are using a var which a reference so it will act as dynmaically typed.
        Closure(param,funcBody, envOld)
     */
    let x = 10          // env is x -> 10
    func checkStatic(){
        let x = 1000
        print("INNER: ", x)
    }
    print("OUTER: ", x)

    checkStatic()
    
    // LIST of all the dataTypes that you will most likely be working with
    let xx : Int = 10
    let y : Float = 3.14
    let z : Double = 3.13141        // difference between float and double is the number range, different amount of bits.
    let f : String = "Hello World"
    let c : Character = "c"          // wrap everything in double quotes
    let b : Bool = true
    let bb : Bool = false

}


/*   Lesson 2: Conditionals and Loops and Operations
        Syntax for conditional clauses:
            If <conditional> {}
            else if <condtional> {}
            else {}
 
        Syntax for operations
            && , and
            || , or
            !  , not
            >< , greater / less than
            %  , modulus
            == , equality
            != , inequality
            ?? , 

 */
func lessonTwo(){
    
    func conditional(){
        let a = 10
        if a > 4{
            print("congrats you just wrote your first conditional in swift")
        }else{
            print("the number you gave for \(a) is not greater than 4")
        }
        
        let b = 10
        if (b == 4){
            print("it won't ever come here")
        }else if (b == 11){
            print("still won't ever come here")
        }else{
            print("good")
        }
    }
    
    // this is case pattern matching for swift
    // NO paranthesis for you cases , it will give you a closure error
    func switchCases(){
        let chr : Character = "b"
        switch chr {
            case "c":
                print("you hit the 'c' case")
                
            case "b", "c":  // If chr is "b" OR "c"
                // unlike scala, you have to inject your conditionals down here , you can't do it next to the case statatment
                print("You hit this case down here")
                
            default:
                print("The code fell through to the default case")
                
        }
    }
    /*
        For loop syntax
            for <counter> in <lower> ... <upper> {
                    <logic>
            }
            
            for <item> in <array or some shit> {
                logic
            }
     
            for _ in <lower> ... <upper>{
                logic
            }
    
        For loop ranges are inclusive.
     
        Kind of wierd thing to think about, if you have
            for i in <lower> ... <upper>
                print(i)
            Similarly to how the counter would contain the item in the array, swift treats the lower -> upper as an array and so i contains the current iteration for the loop. So it will first have 1 . . 2 . . 3 . . 4 . . 5.
            nevermind this isn't wierd, this is how all for loops work in every language...
     */
    func forLoopFunction(){
        
        // loop for how you do iterations normally
        let x = "hello"
        for _ in 0 ... 5{           // underscore because we never, this printed 6 times
            print(x)
        }
        
        // loop for how to iterate through an array
        let myArray = ["firstWord", "secondWord", "thirdWord", "fourthWord"]
        for item in myArray{
            print(item)
        }
        
        // this loop is just here to show you the execution of a loop, loops are inclusive.
        for i in 0 ... 4{
            print(i)
        }
    }
    
    /* While loops are self explantory as in any other language, nothing special */
    func whileLoopFunction(){
        var i = 10
        while i > 0 {
            print(i)
            i = i - 1
        }
        
        // been awhile since you had to keep track of indexes :O
        let myArray = ["John", "Jacob", "Brittany", "Mom", "Dad"]
        var size = myArray.count - 1       // this returns you 5, remember that array indexes start at one
        while (size >=  0){
            print(myArray[size])
            size = size - 1
        }
    }
    

    /* Uncomment these to run the function */
    whileLoopFunction()
    //forLoopFunction()
    //switchCases()
}

/*
    basic syntax of a function
        func name() -> returnType {
            some code
            return someValue
        }
 */
func lessonThree(){
    // basis function with no paramters
    func printSomething(){
        print("Hello World")
    }
    
    // another basic function
    func addTwoNumbers() -> Int{
        let a = 5
        let b = 5
        let sum = a + b
        print(sum)
        return sum
    }

    // throwing in parameters for functions
    func addMyNumbers(using param1: Int, and param2: Int) -> Int {
        print(param1 + param2)
        let sum = param1 + param2
        return sum
    }
    
    // fibonacci functions
    func fib(input n: Int) -> Int {
        if (n == 0 || n == 1){
            return 1
        }
        else{
            return fib(input: n-1) + fib(input: n-2)
        }
    }
    
    /* Uncomment these to run the function */
    let firstNum = 5
    let secondNum = 10
    let n = 5
    let fibSum = fib(input: n)
    print(fibSum)
    addMyNumbers(using: firstNum, and: secondNum)  // notice how xCode autofilled the argLabel
    //printSomething()
    //addTwoNumbers()
}

/* Classes and Objects
    
    
 */
func lessonFour(){
    
    func employeeClass(){
     /* use structs when you just want to create objects, then use classes when you actually want to operate on those objects */
        
        class Employee{
            private
            // declaring you attributes
            let name, role : String
            var salary : Double
            
            // this is your default constructor
            // remember to but datatypes in ascending order , don't know if swift catches this is optimization :/
            init(){
                self.name = ""
                self.role = ""
                self.salary = 0
            }
            
            // constructor given parameters, don't worry about argumentLabels its just fluff
            init( givenName: String,  givenRole: String,  givenSalary: Double ){
                self.name = givenName
                self.role = givenRole
                self.salary = givenSalary
            }
            public
            // defines methods in this class
            
            func printAttributes(){
                print("Employee name: \(self.name)\nEmployee Role: \(self.role)\nEmployee Salary: \(self.salary)\n ")
                print("Congrats you made a class with elements in it in Swift!")
            }
            
            func promotion(){
                print("\(self.name) is getting a raise of 100 dollars!")
                print("\(self.name)'s previous salary was \(self.salary)")
                self.salary = self.salary + 100
                print("\(self.name)' new salary is \(self.salary)")
            }
            
            func doWork(){
                print("Hi I am \(self.name) and I am doing work!")
            }
        }
        /*
                now we we are going to be creating a sub class that will inherit from. Now notice that when you inherit from a superclass or a parent class you are not going to give it any attributes because these objects will be crafted the same way as the objects in its parant class. To specify a sub-class you just give it the parent class as a data type.
         
                When you want to create functions that are rather similar to its super class you will call the function with this syntax
                    super.<funcNameFromParent>
        */
        class Manager : Employee{
            var teamSize = 0        // you can give it new predefined attributes, if you want to override a attribute then you have to say override
            
            // allowing the method for the parent class to be called with the same function name, but with respect objects that are : Manager
            override func doWork() {
                super.doWork()      // executes what the original method does, its referening its parent's class DoWork method
                
                // after that you can add whatever else you want to do
                print("I'm managing people")
                self.salary = self.salary + 100
            }
        }
        let jon = Employee(givenName: "Jon", givenRole: "Systems Design Engineer", givenSalary: 1000000)
        //jon.printAttributes()
        //jon.promotion()
        jon.doWork()
        
        let Jane = Manager(givenName: "Jane", givenRole: "Manager", givenSalary: 5400)
        Jane.doWork()
    }
    /* Uncomment these to use the functions and create objects */
    employeeClass()
}

func lessonFive(){
    func optionalFunction(){
        class XmasPresent{
            func suprise() -> Int {
                print("suprise muthafucka")
                return Int.random(in: 1 ... 10)
            }
        }
        
        let present: XmasPresent? = XmasPresent()
        
        /* this is pretty much unboxing the data type, theres probably a better way to do this via case pattern matching */
        func operateOnOptional(opt: XmasPresent?){      // you gave a parameter as an var that could be nil or it could be an 'XmasPresent'
            if (opt == nil){
                print("you gave me a nil optional")
            }else{
                print("this optional contains XmasPresent")
                opt?.suprise()
            }
        }
        operateOnOptional(opt: present)
        
        
        // optional binding, another way to check type of an optional
        if let actualyPresent = present {       // this checks if present is not nil or not, better way of unboxing things.
            print("here")
            print(actualyPresent.suprise())
        }
        
        // you can also unbox optionals via the !
        if present != nil{
            print("You just unboxed via !")
            print(present!.suprise())
        }
        
        // unboxing optional chaining
        present?.suprise()  // checks the optional and does the function if it is a object
    }
    
    func moreOptionals(){
        /* recap of declaring optionals */
        var a: String = "hey"       // normal declaration
        var b: String? = nil        // explicit way to define an optional
        var c:String?           // automatically sets nil for you if no String object is placed in it
        
        /* auto unwrap, d will be an pre-unwrapped optional if an object is in it, otherwise it can still be nil
            you can do these with these data types because strings have member functions just like any other class that you are trying to get your hands on
         */
        var d:String!
        
        
        class XmasPresent{
            func suprise() -> Int {
                print("suprise muthafucka")
                return Int.random(in: 1 ... 10)
            }
        }
        /* remember that you need to unbox this if you plan on using this variable */
        var present1: XmasPresent? = nil
        
        /* you don't need to unbox it because you pre-unboxed it */
        var present2: XmasPresent! = nil
    }
    
    
            
        
    
    
    /* Uncomment these to use functions and create objects */
    //optionalFunction()      // basics of optionals
}

/*
    Inhertiance:
        IMPORTANT: If you are going to instanciate a new constructor in an inherited class with new attributes, you MUST predefine those attributes since you are going to be mainly inheritting the initialization from the root class where those values are NOT predefined.
        This is important because it keep all your code grouped together nicely so that they all have access to their member functions and such. Think of normalizing data (3NF) and how it keeps everything grouped together precisesly.
 
 */
func lessonSix(){
    class Person{
        var name: String        // attributes
    
        init(_ name: String){
            self.name = name
        }
    }
    
    class Employee: Person{
        /* adding employee attributes */
        var role : String = ""
        var salary : Double = 0.0
        
        // overriding init function on super class so we can still use whats going on before, but we are going to be adding on to it
        override init(_ name: String){
            // inheriting
            super.init(name)
            // adding default for the extra attributes we had previously added
            role = "Analyst"
            salary = 100
        }
        
        // methods
        func doWork(){
            print("My name is \(self.name) and I am doing work.")
            self.salary += 2
        }
    }
    
    class Manager: Employee{
        // creating bonus properties
        var teamSize:Int = 0
        var bonus: Int { return teamSize * 1000 }
        
        init(_ name: String, _ size: Int){
            // this calls the init of the Employee class
            super.init(name)
            
            // additional init work
            teamSize = size
        }
    }
    
    
    /* Uncomment these to create the object */
    // creating a new manager named kate with a team size of 100
    let newManager = Manager("Kate", 100 )
    print(newManager.bonus)
}

/*      Convienience vs Designated Initializer
 
    Convenience initializers are for you to pre-configre the object in a certain way, so its your default constructor they may rely on a designated initializer to ensure that the object is ready to be used.
 
 */
func lessonSeven(){
    class Person{
    private
        var name: String        // uninitialized attribute
        var netWorth: Int?      // int or nil
        var gender: String!     // remmeber the exclamation extends all functionalities of ? but it allows you to immediately use member functions without have to '!'
    public
        
        /* designated initializer because it makes sure that all properties are intialized */
        init(){
            self.name = "none"
        }
        
        /* convinience intializer */
        convenience init (_ gender: String, _ netWorth: Int){
            /* call the designated intializer to ensure that the object is ready to go */
            self.init()
            
            /* Set any other properties or custom code to intialize for this scenario */
            self.gender = gender
            self.netWorth = netWorth
        }
        
        
        // getter methods
        func getName() -> String{
            return self.name
        }
        func getNetWorth() -> Int?{
            if (self.netWorth == nil){
                return nil
            }else{
                return self.netWorth
            }
        }
        func getGender() ->String?{
            if (self.gender == nil){
                return nil
            }else{
                // remember that you pre-unboxed this so you can just return it
                return self.gender
            }
        }
        // setter methods
        func setName(_ name: String){
            self.name = name
        }
        func setNetWorth(_ netWorth:Int){
            self.netWorth = netWorth
        }
        func setGender(_ gender: String){
            self.gender = gender
        }
    }
    
    /* Uncomment these to create the object */
    let p1 = Person()
    print(p1.getName())
    print(p1.getNetWorth())
    print(p1.getGender())
    
    let rich_p1 = Person("boy", 100)
}

/*
    Arrays:
        Syntax:   var <identifier>[<dataType>] = []
        Arrays start indexing at zero and blah blah blah.
 
        Useful method to know is .count => returns the size of the array
 
        For loop quickhands are not the same here as in python, you cannot just say
            for item in <someArray>,        UNLESS, you just want to use each item then you can use this syntax, but you don't have access to mutate anything
              
 */
func lessonEight(){
    // declaring an empty array, two methods
    var emptyArray: [Int] = []
    var emptyArray2 = [String]()
    
    // declaring an array
    var myArray: [Int] = [1,2,3,4,5]
    
    // traversing with for loop, allowing mutations
    //print("For Loop traversal (mutations) :")
    for item in 0...myArray.count-1{
        //print(myArray[item])
    }
    
    // traversing with a for loop, no mutations allowed
    //print("For loop traverseal (immutable) ")
    for item in myArray{
        //print(item)
    }
    
    // traversing with a while loop
    //print("While loop traversal")
    var i = 0
    while( i < myArray.count ) {
        //print(myArray[i])
        i+=1
    }
    
    // array methods, insert, delete, append
    var newArray : [Int] = []
    newArray.append(10)         // appending to the front of the array, this is the one that you are most likely going to be utilizing
    /*  Insert
            You can either pick any spots in the middle that have already been defined, index zero, or the last index
                Wherever you insert that data, it will shift everything else to the right one index.
     */
    newArray.insert(25, at: 0)
    newArray.popLast()          // basic pop method
    
    for i in 10...15{       // adding a lot of stuff fast
        newArray.append(i)
    }
    print(newArray)
    
    /* remember you can also just do assignment the normal way by specifying */
}
/* Dictionaries
        Key value pairs  [key: Value]
        keys must be unique.
 
    To change mapping pairs, just ressign the keys value with that key.
 
 */
func lessonNine(){
    // declaring a string->Int dictionary
    var dict = [String:Int]()
    
    // how to assign data into a dictionary
    dict["x"] = 10
    
    // retrieving from a dictionary
    let ident: Int? = dict["x"]
    if ident == nil{
        //print("nothing was found in the key")
    }else{
        // using the exclamation mark to unbox it
        //print(ident!)
    }
    
    // removing a value from a key
    dict["x"] = nil
    dict["x"] = 10
    // Loop through the items of a dictionary
    for (key, value) in dict{
        //print("\(key) : \(value)")
    }
    
    // checking if a key is in the dictionary, has to do with optionals and stuff
    
    // checking if it is there just for the sake of looking at it
    let keyExists = dict["x"] != nil    // this will return true or false
    if (keyExists == true){
        print(keyExists)
    }else{
        print("The key you are looking for does not exist.")
    }
    
    /* checking to see if the key exists and at the same time extracting, optionals stuff this automatically unboxes the optional
        read up more about optionals
     */
    if let value = dict["x"]{
        print(value)
    }else{
        print("The key you are looking for does not exist.")
    }
    
    /* when you go into key value access a dictionary it returns an optional of either nil or the actual value mapped so you need to unbox it if you want to use it */
    let xx = dict["x"]
    print(xx!)
}

/* Uncomment them for whatever lesson you want to run */
//lessonNine()            // dicitonaries , key value pairs
// lessonEight()       // arrays
// lessonSeven()       // Designated / Convenience Initializers
//lessonSix()         // slighly more advanced things about properties, and more inheritance stuff
//lessonFive()        // optionals
//lessonFour()        // Classes and objects and basic inheritance
//lessonThree()      // functions , recursion
//lessonTwo()      // conditionals, for loops, while loops
//lessonOne()       // variables


