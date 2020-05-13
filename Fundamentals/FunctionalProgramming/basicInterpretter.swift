// AUTHOR: Jonathan Phouminh
// Date: May 7th, 2020
// Practicing enumerations and stuff so that you can eventually recreate an interpretter
import UIKit

/* recreating the Regex enumeration given in Assignment 2 CSCI3155 */
func enumCreation(){
    indirect enum Regex{     // Created a new value type of value
        case Atom(String)
        case Concat(Regex,Regex)
        case Or(Regex, Regex)
        case Star(Regex)
        case And(Regex, Regex)
    }
    
    let v1 = Regex.Atom("hello")
    let v2 = Regex.Star(v1)
    let v3 = Regex.Concat(v1, v2)
    let v4 = Regex.Or(v1,v2)
    let v5 = Regex.And(v4, v4)
    
    switch v2 {
    case let .Star(value):
        print(value)
    case let .Atom(v1):
        print(v1)
    default:
        print("nothing to print")
    }
}


func basicEvalInterpretter(){
    indirect enum Expr{         // arithmetic expressions
        case Plus(Expr,Expr)
        case Minus(Expr,Expr)
        case Star(Expr,Expr)
        case Var(String)   // this will some string, that will be associated with sum
        case Const(Double)
    }
    enum errorValue: Error {
        case invalidArgument
        case doesNotExist(String)  // invalid dictionary lookup
        
    }
    enum Statement{            // assignments to populate our environments through a dictionary
        case Assignment(String, Expr)
    }
    
    // this should return a boxed expression of NumValue
    func evalExpr(expression e: Expr, environment env: [String:Double]) -> Double{
        switch e {
        case let .Const(d):
            return d
        case let .Var(varName):  // make sure that the variable name maps to something and return it
            if (env[varName] != nil){
                return env[varName]!
            }else{
                print("\(varName) does not exist in the dictionary")
                return -999
            }
        case let.Plus(e1 , e2):
            let v1 = evalExpr(expression: e1, environment: env)
            let v2 = evalExpr(expression: e2, environment: env)
            return v1 + v2
        case let.Minus(e1 , e2):
            let v1 = evalExpr(expression: e1, environment: env)
            let v2 = evalExpr(expression: e2, environment: env)
            return v1 - v2
        case let.Star(e1 , e2):
            let v1 = evalExpr(expression: e1, environment: env)
            let v2 = evalExpr(expression: e2, environment: env)
            return v1 * v2
        default:
            print("YOU GAVE ME A BAD EXPRESSION: \(e)")
            return -99999 // figure out how to properly throw an error here or how to handle error values
        }
    }
    
    func updateDictionary(varName s: String, value v: Double, oldEnv env: [String:Double]) -> [String:Double]{
        var newEnv = [String:Double]()
        for (key,value) in env{ // copy the conents of the old dictionary into it first
            newEnv[key] = value
        }
        newEnv[s] = v // it'll either update the existing value, or insert a new entry into the dictionary
        return newEnv
    }
    
    // this function is used to populate the environment
    func evalStatement(_ s: Statement, _ env: [String: Double]) -> [String: Double]{
        switch s {
        case let .Assignment(varName, rhsExpr):
            let v1 = evalExpr(expression: rhsExpr, environment: env)
            let newEnv = updateDictionary(varName: varName, value: v1, oldEnv: env)
            return newEnv  // update this to , newEnv after you fix it
        default:
            print("INVALID ARGUEMNT GIVEN: \(s)")
        }
    }
    
    
    func testCases(){
        func additionTester(){
            let e = Expr.Plus(Expr.Const(10), Expr.Const(5))  // 15
            let ans = evalExpr(expression: e, environment: [String : Double]())
            print("EXPR: \(e)    ANS: \(ans)")
        }
        func starTester(){
            let e = Expr.Star(Expr.Const(20), Expr.Const(10))  // 200
            let ans = evalExpr(expression: e, environment: [String : Double]())
            print("EXPR: \(e)    ANS: \(ans)")
        }
        func minusTester(){
            let e = Expr.Minus(Expr.Const(20), Expr.Const(10))  // 10
            let ans = evalExpr(expression: e, environment: [String : Double]())
            print("EXPR: \(e)    ANS: \(ans)")
        }
        func varTester(){
            let e = Expr.Var("x")  // "tell me what 'x' is mapped to in the dictionary"
            let ans = evalExpr(expression: e, environment: ["x":10])   // should just return me 10
            print("EXPR: \(e)    ANS: \(ans)")
        }
        func assignmentTester(){
            let e = Statement.Assignment("x", Expr.Const(20))  // x = 20
            let ans = evalStatement(e, [String:Double]())  // should populate this dictionary with x->20
            print("env: \(ans)")
        }
        func test1(){
            // 10 + (2 - (2*2)) = 8
            let e = Expr.Plus(Expr.Const(10), Expr.Minus(Expr.Const(2), Expr.Star(Expr.Const(2), Expr.Const(2))))
            let ans = evalExpr(expression: e, environment: [String:Double]())   // should just return me 10
            print("EXPR: \(e)    ANS: \(ans)")
        }
        func test2(){
            // let x = 10
            // x + 10
            let v1 = Statement.Assignment("x", Expr.Const(30))
            let env = evalStatement(v1, [String:Double]())  // populates the dictionary
            let e1 = Expr.Plus(Expr.Var("x"), Expr.Const(10))  // 40
            let ans = evalExpr(expression: e1, environment: env)
            print("EXPR: \(e1)    ANS: \(ans)")
        }
        func lookupErrorTest(){
            let v1 = Statement.Assignment("x", Expr.Const(30))
            let env = evalStatement(v1, [String:Double]())
            let e1 = Expr.Plus(Expr.Var("y"), Expr.Const(10))  // 40
            let ans = evalExpr(expression: e1, environment: env)
    
        }
    }
    /* comment these out to run the tests */
    testCases()
}

/* This portion is just to work on case pattern matching with enumerations */
func numList(){
    enum NumList{
        case Nil
        indirect case Cons(Int, NumList)
    }
    
    /* the user will give us some nth element they want and we will return it to them if the number exists
        * The first position we see will be at index
     */
    func getTheNthElement(numList l: NumList,nth n: Int , _ acc: Int) -> Int{
        switch l {
        case let .Cons(d,rest):
            if (acc == n){  // this means that we found the item
                return d
            }else{
                return getTheNthElement(numList: rest, nth: n, acc+1)
            }
        case .Nil:
            print("N'th element does not exist: \(n)")
            return -9999
        default:
            print("You gave me a bad input: \(l)")
            return -9999
        }
    }
    
    func testNthElement(){
        let v1 = NumList.Cons(5, NumList.Cons(10, NumList.Cons(3, NumList.Nil)))  // [5,10,3]
        
        // test case for getting the first element
        let a1 = getTheNthElement(numList: v1, nth: 0, 0)
        print(a1)
    }
    testNthElement()
}

/*
 Basics of Error Handling, example adopted from official swift documentation
  * Throw errors when something bad happens and redirect the control flow
  * When an error is throw there must be more code that follows up that either tries an alternative approach or bails out and lets the user know the issue

 4 ways to propgate errors in your code
    1. Propogate the error from a function to the code that calls the function
            A throwing function propgates errors that are thrown inside of it to the scope in which it was called.
            Only THROWING functions can propogate errors, erros in non-throwing functions must be handled inside of the function
            
    2. handle an error using a do-catch pattern
    3. handle the error as an Optional value
    4. or , 'assert' that the error will not occur
 
 
 
Examples:
   Throwing an error
        throw errorValue.insuffientFunds(coins:10)
 
/* basic syntax */
     func canThrowError() throws -> String{
         return "I can throw an error"
     }
     func cannotThrowError() -> String{
         return "I cannot throw an error"
     }
     
 */
func errorHandling(){
    enum VendingMachineError: Error{   // all the possible errors that we can encounter in our vending machine
        case invalidSelection
        case insufficientFunds(coinsNeeded: Int)
        case outOfStock
    }
    struct Item{
        var price: Int
        var count: Int
    }
    class VendingMachine{
        var inventory = [
            "Candy Bar": Item(price: 12, count: 7),
            "Chips": Item(price: 10, count: 4),
            "Pretzels": Item(price: 7, count: 11)
        ]
        
        var coinsDeposited = 0

        func vend(itemNamed name: String) throws {
            /* these guard statements execute if they are false , guards must be; break, continue, throw, return */
            guard let item = inventory[name] else {
                throw VendingMachineError.invalidSelection
            }

            guard item.count > 0 else {
                throw VendingMachineError.outOfStock
            }

            guard item.price <= coinsDeposited else {
                throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
            }

            coinsDeposited -= item.price

            var newItem = item
            newItem.count -= 1
            inventory[name] = newItem

            print("Dispensing \(name)")
        }

    }
    
    let favoriteSnacks = [
        "Alice": "Chips",
        "Bob": "Licorice",
        "Eve": "Pretzels",
    ]
    
    /* this is an example of a function that calls a method that propgates its own errors so we need to make sure to write the code accordingly*/
    func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
        let snackName = favoriteSnacks[person] ?? "Candy Bar"
        
        try vendingMachine.vend(itemNamed: snackName)  // need the key word try because the method possibly throws an error
    }
    
    // THIS IS ANOTHER WAY TO HANDLE ERRORS via do catch, this one is cleaner and simple to follow.
    /*
             var vendingMachine = VendingMachine()
             vendingMachine.coinsDeposited = 8
             do {
                 try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
                 print("Success! Yum.")
             } catch VendingMachineError.invalidSelection {
                 print("Invalid Selection.")
             } catch VendingMachineError.outOfStock {
                 print("Out of Stock.")
             } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
                 print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
             } catch {
                 print("Unexpected error: \(error).")
             }
             // Prints "Insufficient funds. Please insert an additional 2 coins."
     */
    
    
    
    
    
}


func main(){
    //enumCreation()
    //basicEvalInterpretter()
    errorHandling()
    //numList()
    
  
}
main()

