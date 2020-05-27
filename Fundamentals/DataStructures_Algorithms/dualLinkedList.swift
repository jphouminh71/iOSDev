// AUTHOR: Jonathan Phouminh
// Date: May 23rd, 2020
// Dual linked list
import UIKit

/* Dually linked list implementation
    isEmpty()
    Length()
    addNode()
    deleteNode()
    search()
    printList()
*/

class Node{
private
    var value: Int
    weak var prev: Node?
    var next: Node?
    
    deinit {
        //print("node with value: \(self.value) is being deallocated")
    }
    init(hasValue value: Int){
        self.value = value
        self.prev = nil
        self.next = nil
    }
    
    func printValue(){
        print("Value: \(self.value)")
    }
    
    func printNeighbors(){
        print(self.prev!.value , " ", self.next!.value)
    }

    func hasNextNode() -> Bool{
        if self == nil || self.next == nil{
            //print("There is no next node")
            return false
        }
        else{
            //print("The next node is \(self.next!.value)")
            return true
        }
    }
    
    func hasPrevNode() -> Bool{
        if self == nil || self.prev == nil{
            //print("There is no next node")
            return false
        }
        else{
            //print("The next node is \(self.next!.value)")
            return true
        }
    }
    
    func getNodeValue() -> Int{
        return self.value
    }
}

class DuallyLinkedList{
private
    var head: Node?
    var tail: Node?

public
    init(){
        self.head = nil
        self.tail = nil
    }
    
    /* we know its empty if the head pointer points to nil */
    func isEmpty() -> Bool {
        if self.head == nil{
            return true
        }else{
            return false
        }
    }
    
    func length() ->Int {
        return lengthHelper(self.head)
    }
    
    func lengthHelper(_ currentNode: Node? , _ acc: Int = 0) -> Int{
        if currentNode == nil || currentNode?.hasNextNode() == false{
            return acc + 1
        }
        else{
            return lengthHelper(currentNode!.next, acc + 1)
        }
    }
    
    func append(hasValue value: Int){
        let newNode = Node(hasValue: value)
        
        if isEmpty(){
            self.head = newNode
            self.tail = newNode
        }else{
            self.tail?.next = newNode
            newNode.prev = self.tail
            self.tail = newNode
        }
    }

    func deleteNode(_ v: Int) -> (){
        if isEmpty(){
            return
        }else{
            deleteNodeHelper(nodeToDelete: v, self.head)
        }
    }
    
    func deleteNodeHelper(nodeToDelete n: Int , _ currentNode: Node? ) -> (){
        if currentNode == nil{
            return
        }
        else if currentNode!.getNodeValue() == n{
            
            /* if it is the only item in the list */
            if currentNode?.prev == nil{
                self.head = currentNode?.next
                currentNode?.next = nil
            }
            
            /* if it is at the end of the list */
            else if currentNode?.next == nil{
                currentNode?.prev?.next = nil
            }
            
            /* if it is in the middle */
            else{
                currentNode?.prev?.next = currentNode?.next
                currentNode?.next?.prev = currentNode?.prev
                currentNode?.next = nil
                currentNode?.prev = nil
            }
        }
        else{
            deleteNodeHelper(nodeToDelete: n, currentNode?.next)
        }
    }

    func search(forValue value: Int) -> Node?{
        return searchHelper(forValue: value, self.head)
    }
    func searchHelper(forValue value: Int, _ currentNode: Node?) -> Node?{
        if currentNode == nil{
            return nil
        }else{
            if currentNode?.getNodeValue() == value{
                print("found")
                return currentNode
            }else{
                return searchHelper(forValue: value,currentNode?.next)
            }
        }

    }
    func printList(){
        printListHelper(self.head)
    }
    
    func printListHelper(_ currentNode: Node?) -> (){
        if currentNode == nil{
            print(".")
        }
        else if currentNode?.hasNextNode() == false{
            print("\(currentNode!.getNodeValue()) ->")
            print("-> nil")
        }
        else{
            print("\(currentNode!.getNodeValue()) ->")
            printListHelper(currentNode?.next)
        }
    }
    
    func printListBackwards(){
        printListHelperBackwards(self.tail)
    }
    
    func printListHelperBackwards(_ currentNode: Node?) -> (){
        if currentNode == nil{
            print(".")
        }
        else if currentNode?.hasPrevNode() == false{
            print("\(currentNode!.getNodeValue()) <-")
            print("<- nil")
        }
        else{
            print("\(currentNode!.getNodeValue()) <-")
            printListHelperBackwards(currentNode?.prev)
        }
    }
}

func main(){

    let nn = DuallyLinkedList()
    nn.append(hasValue: 1)
    nn.append(hasValue: 2)
    nn.append(hasValue: 3)
    nn.append(hasValue: 4)
    
    nn.printList()
    
    nn.deleteNode(3)
    
    /*
    let found = nn.search(forValue: 33)
    if let item = found?.getNodeValue(){
        print(item)
    }else{
        print("nope")
    }
    */
}
main()

/* testing some things */
/*
    notes:
        Structs objects are deallocated when they go out of scope.
 */
class node{
    var value: Int
    
    deinit {
        print("Deinitializing node with value: \(self.value)")
    }
    init(_ value: Int){
        self.value = value
    }
}

var nodey: node? = node(10)
//print(nodey!.value)
//nodey = nil  // since there are no more references pointing to the instance, it will automatically be deallocated

