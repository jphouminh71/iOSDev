// AUTHOR: Jonathan Phouminh
// Date: May 27th, 2020
// Stack implementation in a form of a linked list and array, this will be a generic stack so it can hold any type
/*      supporting functions
 
    isEmpty()  , done
    isFull()   , done
    peek()     , done
    push()     , done
    pop()      , done
    printStack() ,  done
    printStackType()   , done
 */
import UIKit
/* Array Implementation */
class ArrStackey<T>{
private
    let stackCapacity:Int
    var currentStackSize: Int
    var topItem: T?
    var stackey:[T]
public
    init(hasCapactiy cap: Int) {
        self.topItem = nil
        self.stackCapacity = cap
        self.currentStackSize = 0
        self.stackey = [T]()
    }
    func isEmpty() -> Bool{
        if currentStackSize == 0{
            print("Stack is empty")
            return true
        }else{
            return false
        }
    }
    func isFull() -> Bool{
        if currentStackSize == stackCapacity{
            print("Stack is full")
            return true
        }else{
            return false
        }
    }
    func printTypeOfStack() -> (){
        print(type(of: self.stackey))
    }
    func peek() -> T?{
        if !(self.stackey.isEmpty){
            return self.topItem         // case where we return the top item
        }else{
            return nil
        }
    }
    func printStack() -> (){
        print(self.stackey)
    }
    /* doesn't need to be mutating because classes are references */
    func push(value v: T) -> (){
        self.stackey.append(v)
        self.currentStackSize = self.currentStackSize + 1
    }
    func pop(){
        assert(self.isEmpty() == false, " You cannot pop an empty stack ")  // should never be able to pop if its empty
        self.stackey.removeLast()
        self.currentStackSize = self.currentStackSize - 1
    }
}

func stackArr(){
    let stackey = ArrStackey<Int>(hasCapactiy: 10)
    stackey.push(value: 1)
    print(type(of: 1))
    print(type(of: stackey))
    stackey.push(value: 2)
    stackey.push(value: 3)
    stackey.push(value: 4)
    stackey.push(value: 5)
    stackey.printStack()
    print("\n")
    
    let stackeyS = ArrStackey<String>(hasCapactiy: 10)
    stackeyS.push(value: "a")
    stackeyS.push(value: "b")
    stackeyS.push(value: "c")
    stackeyS.push(value: "d")
    stackeyS.push(value: "e")
    stackeyS.push(value: "f")
    stackeyS.printStack()
    
    for _ in 0 ... 5{
        stackeyS.pop()
    }
    stackeyS.printStack()
}

/* Linked List implementation, singly linked  */
/* Node has to be a class because it can't have implicit reference to itself? */

class Node<T>{
    let value: T
    let uniqueHashCode = UUID()
    var next: Node?
    init(hasValue value: T) {
        self.value = value
        self.next = nil
    }
    
}
extension Node{
    func printValue() -> (){
        print("Node Value: \(self.value)")
    }
    
    /* creating this just for the purpose of the pop function */
    func isNotEqual<T>(otherNode node: Node<T>) -> Bool{
        if self.uniqueHashCode != node.uniqueHashCode{
            return true
        }else{
            return false
        }
    }

}


class StackeyLL<T>{
private
    var head: Node<T>?
    var tail: Node<T>? // tail should always be the top
    var currentStackSize: Int
    let stackCapacity: Int
public
    init(hasCapacity cap: Int) {
        self.stackCapacity = cap
        self.head = nil
        self.tail = nil
        self.currentStackSize = 0
    }
    
    func isFull() -> Bool {
        if (self.currentStackSize == self.stackCapacity){
            print("Stack is full.")
            return true
        }else{
            return false
        }
    }
    
    func isEmpty() -> Bool {
        if (self.currentStackSize == 0){
            return true
        }else{
            return false
        }
    }
    
    func peek() -> (){
        if self.currentStackSize == 0{
            assert(self.isEmpty() == false , "stack is empty : cannot peek" )
        }else{
            print(self.tail!.printValue())
        }
    }
    
    func push(value v: T) -> (){
        if stackCapacity == currentStackSize{
            assert(stackCapacity != currentStackSize, "Stack is full : cannot push \(v) onto the stack ")
        }
        else if self.isEmpty(){
            let newNode = Node(hasValue: v)
            self.head = newNode
            self.tail = newNode
            self.currentStackSize = self.currentStackSize + 1
        }
        else{
            let newNode = Node(hasValue: v)
            self.tail?.next = newNode
            self.tail = newNode
            self.currentStackSize = self.currentStackSize + 1
        }
    }
    
    func pop() ->(){
        if self.isEmpty(){
            assert(self.isEmpty() == false, "Cannot pop: Stack is empty")
        }else{
            if self.currentStackSize == 1{
                self.head = nil
                self.tail = nil
            }else{
                /* have to get the node that is right before the tail , this will be slow but it works */
                var tempptr = self.head
                while tempptr?.next?.isNotEqual(otherNode: self.tail!) == true{
                    tempptr = tempptr?.next
                }
                /* at this point we have found the node before the tail */
                print(tempptr?.value)
                tempptr!.next = nil
                self.tail = tempptr
                tempptr = nil
                
            }
        }
    }
    func printStack() -> (){
        if self.isEmpty(){
            print("Cannot print : Stack is empty")
        }else{
            var tempptr = self.head
            while tempptr != nil{
                tempptr?.printValue()
                tempptr = tempptr?.next
            }
        }
        
    }
}



func stackLL(){
    let stackey = StackeyLL<Int>(hasCapacity: 10)
    stackey.push(value: 1)
    stackey.push(value: 2)
    stackey.push(value: 3)
    stackey.push(value: 4)
    //stackey.printStack()
    
    let stackeyS = StackeyLL<String>(hasCapacity: 10)
    stackeyS.push(value: "a")
    stackeyS.push(value: "b")
    stackeyS.push(value: "c")
    stackeyS.push(value: "d")
    stackeyS.printStack()
    stackeyS.pop()
    print("------------")
    stackeyS.printStack()
}


func main(){
    //stackArr()
    stackLL()
}

main()

