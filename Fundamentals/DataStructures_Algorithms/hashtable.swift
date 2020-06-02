// AUTHOR: Jonathan Phouminh
// Date:  June 1st, 2020
// Going to create 2 versions of a hash table that handle collisions with linear probing, could also do resolve with quadratic probing or chaining.
// Hash table will store strings
// hash table is unfinished, would still have to go implement the removal function and search function. 

import UIKit

class HashTable1{
private
    var hashTableSize: Int
    var currentItemCount: Int
    var numCollisions: Int
    var hashTable: [String?]
    
    func Hash(forWord word: String) -> Int{
        let unicodeScalars = word.unicodeScalars.map {$0.value}
        return unicodeScalars.reduce(5381){
            ($0 << 5) &+ $0 &+ Int($1)
        }
    }
public
    init(hasCapacity c: Int ) {
        self.hashTableSize = c
        self.currentItemCount = 0
        self.numCollisions = 0
        self.hashTable = [String?](repeatElement(nil, count: c)) // you want to initialize this with
    }
    func getHash(forWord word: String) -> Int{
        return Hash(forWord: word) % self.hashTableSize
    }
    func printTable() -> (){
        print(self.hashTable)
    }
    
    ///* This function will just tell us if a bucket is already filled , you will be handling collisions in a separate function
    func isFull(_ word: String) -> Bool{
        return self.hashTable[self.getHash(forWord: word)] != nil
    }
    
    ///* Function will be called when finding a collision and will linearly probe each bucket until it finds one that is not filled
    func reHash(_ word: String, _ currentHashIndex: Int) -> (){
        if (self.hashTable[currentHashIndex] == nil){
            self.hashTable[currentHashIndex] = word
        }else{
            if (currentHashIndex >= self.hashTableSize - 1){
                reHash(word, 0)      // loop it back to the middle
            }else{
                reHash(word, currentHashIndex + 1)
            }
        }
    }
    func addWord(_ word: String) -> (){
        let ans = isFull(word)
        ///* make sure to be checking the current item count
        if (self.currentItemCount == self.hashTableSize - 1 ){
            print("HASH TABLE IS FULL, cannot add item \(word)")
            return
        }
        else if (ans){
            ///* handle collions here
            self.numCollisions += 1
            reHash(word, self.getHash(forWord: word))
        }else{
            self.hashTable[getHash(forWord: word)] = word
        }
    }
}
func probingHash() -> (){
    let hashey = HashTable1(hasCapacity: 10)
    hashey.addWord("hello")
    hashey.addWord("hello")
    hashey.addWord("hello")
    hashey.addWord("hello")
    hashey.addWord("hello")
    hashey.addWord("hello")
    hashey.addWord("hello")
    hashey.addWord("hello")
    hashey.addWord("hello")
    hashey.addWord("hello")
    hashey.printTable()
}

func main(){
    probingHash()
}
main()



///*   This is how you will beo converting characters to actualy number values for when you hash them
/*
     let aAscii: UInt8? = Character("a").asciiValue
     let bAscii: UInt8? = Character("b").asciiValue
     let zAscii: UInt8? = Character("z").asciiValue
     print(aAscii! + bAscii!)
     print(aAscii!)
     print(bAscii!)
     print(zAscii!)
*/

