import UIKit

func randomStuff(){
    
    func tuples(){
        /* this is how you create a tuple and how you evaluate a tuple */
        let myTuple = (1,2,3)
        print(myTuple.1)
        
        /* you can name the elements of a tuple too */
        let http200Status = (statusCode: 100, desc: "OK")
        print(http200Status.statusCode)
    }
    
    func optionals(){
        // declaring an optional value
        var myOptional : String?
        
        // setting the optional to have an actual value
        myOptional = "You found me"
        
        if (myOptional != nil){
            //print("There is something to unbox!")
            
            // foce unwrap with a !
            //print(myOptional!)
        }else{
            //print("There was nothing in the box...")
        }
        
        
        var conversion: String = "Hello world"
        
        /* unboxing optionals via optional binding */
        if let actualNumber = Int(conversion){
            //print("The string \(conversion) has the value of \(actualNumber)")
        }else{
            //print("the string \(conversion) could not be converted to an integer")
        }
        
        /* optional let bindings can be more complex, the following two statements are equivalent */
        var firstNumber: String = "1"
        var secondNumber: String = "2"
        
        if let firstNumber = Int(firstNumber) , let secondNumber = Int(secondNumber), firstNumber == 1 && secondNumber == 2{
            print("success")
        }else{
            print("failure")
        }
        
        /* if you are going to do optional binding then its best nest since its a lot cleaner*/
        if let first = Int(firstNumber){
            if let second = Int(secondNumber){
                if (first == 1 && second == 2){
                    print("success2")
                }
            }
        }
    }
    
    func moreOptionals(){
        let x : String = "hello"
        
        let xx: Int = 5
        let y : Int = 10
        
        /* this is how you compute a value into a variable, no equals sign and */
        var z: Int  {
            if (xx > y){
                return xx
            }else{
                return y
            }
        }
        //print(z)
        
        /* good method to use when unboxing things */
        let defaultColorName : String = "black"
        var userDefinedColor: String?  // defaults to nil
        
        // unwrapping, code is equivalent too, x = (a! : b)
        let colorChosen: String =  userDefinedColor ?? defaultColorName
        //print("Chosen color: \(colorChosen)")
        
        
        var node: Int?
        node = 10
    
        // Swift does NOT treat integer values as true or false.
        if(node != nil){
            print("you unwrapped: \(node!)")
        }else{
            print("nothing to unwrap")
        }
    }
    
    func ternary(){
        let question = true
        let y = 50
        
        let sum = y + (question ? 1 : 2)        // you must have a space mark or else itll become an optional
        print(sum)
    }
    /* uncomment these to run the random functions */
    //ternary()
    moreOptionals()
    //optionals()
    //tuples()
        
}

func collections(){
    /*  dictionaries , key value pairs
            They perform as any other dictionary but it is important to realize that dicitonaries return optionals, so you have to unpack it.
    */
    func dict(){
        var dict = [String: Int]()
        dict["x"] = 10
        
        // unpacking the access of a dict
        let answer = dict["x"] ?? -10
        print(answer)
        
        // trying to access a dictionary value that doesn't exist
        let doesntExist = dict["y"] ?? -10
        print(doesntExist)
    }

    // sets,  unordered unique values
    
    
    
    // arrays, ordered values
    
    // creating an array with default values
    func arrays(){
        var preloadedArray = Array(repeating: 0.0, count: 10)
        print(preloadedArray)
        
    
    }
    
    /* recall that all of this becomes useful with functional programming, specifically, CPS functions*/
    func implicitFunctions(){
        func assigningFunctions(){
            func addTwoNumbers(arg1: Int, arg2: Int) -> Int{
                arg1 + arg2
            }
            
            let mathFunction: (Int, Int) -> Int = addTwoNumbers
            print(mathFunction(1,2))
        }
        
        /* functions as parameters */
        func funcAsParam(){
            let x = 5
            let y = 5
            
            func addTwoNumbers(arg1: Int, arg2: Int) -> Int{
                arg1 + arg2
            }
            
            // returns are implicit for one line function bodies
            func coolFunction(_ mathFunction: (Int, Int) -> Int, _ arg1: Int, _ arg2: Int) -> Int{
                mathFunction(arg1,arg2)
            }
            
            let z = coolFunction(addTwoNumbers(arg1:arg2:), x, y)
            print(z)
        }
        
        
        /* uncomment these to call the functions */
        //assigningFunctions()
        funcAsParam()
        
        
        
    }
    
    /* uncomment these to run the functions */
    dict()
    arrays()
    implicitFunctions()
}






/* uncomment these for any function that you want to run */
randomStuff()
//collections()

