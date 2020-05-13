// AUTHOR: Jonathan Phouminh
// DATE: May 7th, 2020
// A bunch of common problems that will help you get more comforatble with Swift syntax
// all of this will be done through recursion to try to nail down functional programming concepts
import UIKit


/* isPalindrome, function that just checks if a word is a palindrome
    A word is a palindrome if
        - length of a word is <= 1
        - opposite index contents are equal
 */
func isPalindrome(_ word: String) -> Bool{
    // base case
    if (word.count <= 1){
        return true
    }else{
        // if this is true then we continue on
        if (word[word.index(word.startIndex, offsetBy: 0)] == word[word.index(word.endIndex, offsetBy: -1)]){
            let start = word.index(word.startIndex, offsetBy: 1)
            let end = word.index(word.endIndex, offsetBy: -1)
            let range = start ..< end
            return isPalindrome(String(word[range]))
        }
        // otherwise just bail out and return false
        else{
            return false
        }
    }
}
func testPalindromes(){
    print("-----------------")
    /* Test cases for isPalindrome */
    let testcases:[String] = ["hellolleh", "", "a", "xxxxxxxx", "ablewasiereisawelba"]
    let testcases2: [String] = ["bababablacksheep","ab", "ydudh", "America"]
    var ans = false
    
   // this loop iterates through the array of words that are palindromes
    for i in 0 ... testcases.count-1 {
        ans = isPalindrome(testcases[i])
        if (ans == false){
            print(" \(testcases[i]) failed , it should be a palindrome")
            ans = false
            break
        }
    }
    if (ans == true){
        print("TESTS PASSED for Palindrome Array")
    }
    ans = false
    
    // this loop iterates throught he array of words that are not palindromes
    for j in 0 ... testcases2.count-1{
        ans = isPalindrome(testcases2[j])
        if (ans == true){ // if it is true then it is wrong, because these should all be false
            print(" \(testcases2[j]) failed, it should not be a palindrome")
            ans = false
            break
        }
    }
 
    if (ans == false){ // should be false here because none of them should have passed
        print("TESTS PASSED for !Palindrome Array")
    }
    print("-----------------")
}

/*  IsOddFunction, this function will just check to see if a function is odd an odd function
        A function is an odd function if f(-1) and -f(1) are equivalent for all numbers (just giving it a range)
 */
func isOddFunction(inputFunction f: (Int) -> Int , upToN n: Int) -> Bool{
    if (n == 1){
        if (f(-1) == -(f(1))){
            return true
        }else{
            return false
        }
    }else{
        if (f(-n) == -(f(n))){
            return isOddFunction(inputFunction: f, upToN: n-1)
        }else{
            return false
        }
    }
}
func testIsOddFunction(){
    let oddFunction = {     // anonymous function
        (input: Int) -> Int in
            return 5 * input
    }
    let evenFunction = {     // anonymous function
        (input: Int) -> Int in
            return input * input
    }
    let n = 10
    let v1 = isOddFunction(inputFunction: oddFunction, upToN: n)
    let v2 = isOddFunction(inputFunction: evenFunction, upToN: n)
    
    if (v1){
        print("Odd Function passed!")
    }
    if (v2 == false){
        print("Even function passed! (did not pass)")
    }
}


/* BitStrConversion,
    this function will take a given bitstring like 1001 and convert it into its decimal equivalent -> 9
        Goal: practice writing recursion that is tail optimized , its no faster than looping but it is a cleaner way to write the code. Swift does its best to perform tail call optimizations.
 
    Function takes in a bitstring and also an accumulator, bitString will be processed from right to left.
 */
func BitStrConversion(bitString bit: String, currentIndex n: Int ,_ acc: Int) -> Int{
    if (bit.count == 1){
        if (bit[bit.index(bit.startIndex, offsetBy: 0)] == "1"){
            // return the accumulator + _
            return acc + Int( pow(Double(2), Double(n)))
        }else{
            return acc
        }
    }
    else{
        if (bit[bit.index(bit.endIndex, offsetBy: -1)] == "1"){
            let range = bit.index(bit.startIndex, offsetBy: 0) ..< bit.index(bit.endIndex, offsetBy: -1)
            return BitStrConversion(bitString: String(bit[range]), currentIndex: n+1 ,acc + Int(pow(Double(2), Double(n)))) // have to cast it as a String to create a new one, garbage collection thing
        }else{
            let range = bit.index(bit.startIndex, offsetBy: 0) ..< bit.index(bit.endIndex, offsetBy: -1)
            return BitStrConversion(bitString: String(bit[range]), currentIndex: n+1 ,acc )

        }
    }
}

func testBitStrConv(){
    let f1 = "1001"  // 9
    let f2 = "1111" // 15
    let f3 = "10"
    
    let v1 = BitStrConversion(bitString: f1, currentIndex: 0,  0)
    let v2 = BitStrConversion(bitString: f2, currentIndex: 0,  0)
    let v3 = BitStrConversion(bitString: f3, currentIndex: 0,  0)
    
    if (v1 == 9){
        print("Test case one passed!")
    }
    
    if (v2 == 15){
        print("Test case two passed!")
    }
    
    if (v3 == 2){
        print("Test case three passed!")
    }
}



/* this is where you just test out syntax stuff and figure out how things work */
func testItems(_ choice: Int){
    switch choice {
    case 1: // substring
        // substring is wierd, you cannot access a strings character by int index
        let dummy = "helloWorld"
        let start = dummy.index(dummy.startIndex, offsetBy: 1) // startIndex , its like str[0]
        let end   = dummy.index(dummy.endIndex, offsetBy: -1) // endIndex, its the index AFTER the last character

        // this is essentially the collection of everything between , NOT INCLUSIVE
        let range = start ..< end
        print(dummy[range])
        
    case 2: // closures and passing closures to functions
        // creating a higher order function that processes a given x
        func reciever(_ f: (Int) -> Int, _ x: Int) -> Int{
            return f(x)
        }
        // this is an odd function
        let closure = {
            (input:Int) -> Int in
            return 5 * input
        }
        print(reciever(closure, 2))
    
    default:
        print("Invalid option")
    }
}

func main(){
    //testPalindromes()
    //testIsOddFunction()
    testBitStrConv()
    //testItems(2)
}
main()


