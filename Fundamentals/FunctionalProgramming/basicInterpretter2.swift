// AUTHOR: Jonathan Phouminh
// Date: May 11th, 2020
/* BasicInterpretter2
        This will be an extension of the first basic interpretter of the Lettuce langauge. It will support function calls and function definitions and also introduce handling errors when they arise. Functions will only be sinlge parameters.
        Functions will strictly just be trivial things like
            func add1(_ x: Int){
                x + 1
            }
      
 */
import UIKit

func interpretter(){
    
    indirect enum Expr{         // arithmetic expressions
        case Plus(Expr,Expr)
        case Minus(Expr,Expr)
        case Star(Expr,Expr)
        case Ident(String)   // this will some string, that will be associated with sum
        case Const(Double)
        /* new stuff */
        case Let(String, Expr, Expr)  // Identifier, expression, remainingCode
        case FunDef(String, Expr)  // parameter, funcbody
        case FunCall(Expr,Expr)
    }
    enum errorValue: Error {
        case invalidArgument(x:String)
        case doesNotExist(x: String)  // invalid dictionary lookup
        
    }
    
    enum Value{
        case BoolValue(Bool)
        case NumValue(Double)
        case Closure(String,Expr,[String:Value]) // inputIdentifier, fBody, closedEnv
    }
    
   
    func updateDictionary(varName s: String, value v: Value, oldEnv env: [String:Value]) -> [String:Value]{
        var newEnv = [String:Value]()
        for (key,value) in env{ // copy the conents of the old dictionary into it first
            newEnv[key] = value
        }
        newEnv[s] = v // it'll either update the existing value, or insert a new entry into the dictionary
        return newEnv
    }
    
    func evalExpr(expression e: Expr, environment env: [String:Value]) throws -> Value{
        func ValueToNum(inputValue1 v1:Value) -> Double{
            switch v1 {
            case let.NumValue(d):
                return d
            default:
                print("YOU GAVE ME A BAD INPUT IN VALUE TO NUM: \(v1)")
                return -9999
            }
        }
        switch e {
        case let .Const(d):
            return Value.NumValue(d)
        case let .Ident(varName):  // make sure that the variable name maps to something and return it
            if (env[varName] != nil){
                return env[varName]!
            }else{
                throw errorValue.doesNotExist(x: "\(varName) , does exist in the dictionary")
            }
        case let.Plus(e1 , e2):
            let v1 = try evalExpr(expression: e1, environment: env)
            let v2 = try evalExpr(expression: e2, environment: env)
            return Value.NumValue(ValueToNum(inputValue1: v1) + ValueToNum(inputValue1: v2))
        case let.Minus(e1 , e2):
            let v1 = try evalExpr(expression: e1, environment: env)
            let v2 = try evalExpr(expression: e2, environment: env)
            return Value.NumValue(ValueToNum(inputValue1: v1) - ValueToNum(inputValue1: v2))
        case let.Star(e1 , e2):
            let v1 = try evalExpr(expression: e1, environment: env)
            let v2 = try evalExpr(expression: e2, environment: env)
           return Value.NumValue(ValueToNum(inputValue1: v1) * ValueToNum(inputValue1: v2))
        
        /* new stuff */
        case let.Let(x, e, rest):
            let v1 = try evalExpr(expression: e, environment: env)
            let newEnv = updateDictionary(varName: x, value: v1, oldEnv: env)
            return try evalExpr(expression: rest, environment: newEnv)

        case let.FunDef(param, fbody):
            return Value.Closure(param, fbody, env)
            
        case let.FunCall(fCalleeName, finput):
            let closure_returned = try evalExpr(expression: fCalleeName, environment: env) // returns a closure
    
            switch closure_returned {
            case let.Closure(x, fbody, envOld):
                let paramOK = try evalExpr(expression: finput, environment: env)
                let newEnv = updateDictionary(varName: x, value: paramOK, oldEnv: envOld)
                return try evalExpr(expression: fbody, environment: newEnv)

            default:
                throw errorValue.invalidArgument(x: "\(fCalleeName) , is not a function in the dictionary.")
            }
        default:
            throw errorValue.invalidArgument(x: "\(e) , is not a valid Expression for EvalExpr.")
        }
    }
    
    /* test functions */
    func basicArith(){
        // 10 + (2 - (2*2)) = 8
        let e = Expr.Plus(Expr.Const(10), Expr.Minus(Expr.Const(2), Expr.Star(Expr.Const(2), Expr.Const(2))))
        do {
            let ans = try evalExpr(expression: e, environment: [String:Value]())   // should just return me 10
            print("EXPR: \(e)    ANS: \(ans)")
        } catch errorValue.doesNotExist{
            print(errorValue.doesNotExist)
        } catch errorValue.invalidArgument(let message){
            print(message)
        } catch {
            print("Unexpected Error: \(error)")
        }
    }

    func basicLet(){
        // let x = 10 in
            //  x + 10        , program returns 20
        let e1 = Expr.Plus(Expr.Ident("x"),Expr.Const(10))
        let e2 = Expr.Let("x", Expr.Const(10), e1)
        do{
            let ans = try evalExpr(expression: e2, environment: [String:Value]())
            print("EXPR: \(e2)    ANS: \(ans)")
        } catch errorValue.doesNotExist{
            print(errorValue.doesNotExist)
        } catch errorValue.invalidArgument(let message){
            print(message)
        } catch {
            print("Unexpected Error: \(error)")
        }
    }

    /* we will first test to make sure that the interetter returns a closure
     then we will test to make sure that the definition was updated accordingly
     */
    func funDefTest(){
        /*
           let f = (x) in x + 10
                             in 10  */
        let e1 = Expr.FunDef("x", Expr.Plus(Expr.Ident("x"), Expr.Const(10)))
        //print(evalExpr(expression: e1, environment: [String:Value]()))
        let e2 = Expr.Let("f", e1, Expr.Const(10))
        
        do{
            let ans = try evalExpr(expression: e2, environment: [String:Value]())
            print("EXPR: \(e2)    ANS: \(ans)")
        } catch errorValue.doesNotExist{
            print(errorValue.doesNotExist)
        } catch errorValue.invalidArgument(let message){
            print(message)
        } catch {
            print("Unexpected Error: \(error)")
        }
    }

    func funCallTest(){
        /*
           let f = (x) in x + 10
                             in f(25)    ,  function returns 35 */
        let e1 = Expr.FunDef("x", Expr.Plus(Expr.Ident("x"), Expr.Const(10)))
        let e2 = Expr.Let("f", e1, Expr.FunCall(Expr.Ident("f"), Expr.Const(25)))
        do {
            let ans = try evalExpr(expression: e2, environment: [String:Value]())
            print("EXPR: \(e2)    ANS: \(ans)")
        } catch errorValue.doesNotExist{
            print(errorValue.doesNotExist)
        } catch errorValue.invalidArgument(let message){
            print(message)
        } catch {
            print("Unexpected Error: \(error)")
        }
    }
    
    /* uncomment to run the test cases*/
    //basicArith()
    //basicLet()
    //funDefTest()
    //funCallTest()
}
func main(){
    interpretter()
}

main()




