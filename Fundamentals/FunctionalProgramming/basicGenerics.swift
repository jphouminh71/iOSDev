// AUTHOR: Jonathan PHouminh
// Date: May 13th, 2020
// Continuation Passing Style, Tail Recursion, Generics

import UIKit

func basicTailRecursion(){
    /* accumulator */
    func acc_tail(inputList lst: [Double], startAcc acc: Double = 0) -> Double{
        if (lst.count <= 1){
            if lst.isEmpty{
                return acc
            }else{
                return acc + lst[0]
            }
        }else{
            return acc_tail(inputList: Array(lst[1...lst.count-1]), startAcc: acc + lst[0])
        }
    }
    
    /* factorial calculator */
    func factorial_tail(input n: Int, startAcc acc: Int = 1) -> Int{
        if (n <= 1){
            return acc
        }else{
            return factorial_tail(input: n-1, startAcc: acc * n)
        }
    }
    
    /* test cases  */
    func accTest(){
        let testList: [Double] = [1,2,3,4,5]   // 15
        let ans = acc_tail(inputList: testList, startAcc: 0)
        print("ANS: \(ans)")
    }
    func factorialTest(){
        let n = 5   // 5 * 4 * 3 * 2 * 1
        let ans = factorial_tail(input: n, startAcc: 1)
        print("ANS: \(ans)")
    }
    
    //accTest()
    factorialTest()
}

/* have to include this code to support generic arithmetic */
protocol Addable {
    static func +(lhs: Self, rhs: Self) -> Self
}
extension String:Addable{}
extension Double:Addable{}

func basicGenerics(){
    /* generic function that takes in a list of any type and prints out its contents*/
    func printGeneric<T>(_ lst: [T]) ->(){
        for item in lst{
            print(item)
        }
    }
    
    /* takes in a list of type T, and appends item of type T*/
    func addTwoItems<T:Addable>(first v1: T, second v2: T) -> T{
        return v1 + v2
    }
    
    /*  Test functions */
    func printGenericTest(){
        let StringArr: [String]  = ["hi","hello","world"]
        let DoubleArr: [Double] = [1.0,2.0,3.0,4.0]
        printGeneric(StringArr)
        printGeneric(DoubleArr)
    }
    
   
    func addTwoItemsTest(){
        let StringArr: [String]  = ["hi","hello","world"]
        let DoubleArr: [Double] = [1.0,2.0,3.0,4.0]
        let s1 = "hello"
        let s2 = "world"
        print(addTwoItems(first: s1, second: s2))
        print(addTwoItems(first: StringArr[0], second: StringArr[1]))
        print(addTwoItems(first: DoubleArr[1], second: DoubleArr[2]))
    }
    
    
    //printGenericTest()
    addTwoItemsTest()
}


func main(){
    //basicTailRecursion()
    basicGenerics()
    
    
   
    
}

main()

