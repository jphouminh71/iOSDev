// AUTHOR: Jonathan Phouminh
// Date: May 30th, 2020
// Queue Implementation via linked list and array
/*   Queues will support the following operation   ,  generic implementation
    
        isEmpty
        isFull
        enqueue
        dequeue
        peek
        printQueue
 */
import UIKit

// Array Implementation

class qArr<T>{
private
    let queueCap: Int
    var queue: [T]
    var topItem: T? {           // the first index (0) , will be the next item in the queue  , this is an example of a calculated value
        get{
            if queue[0] == nil{
                return nil
            }else{
                return queue[0]
            }
        }
    }
public
    init(hasCapacity cap: Int) {
        self.queueCap = cap
        self.queue = [T]()
    }
    func printQueue() -> (){
        print(self.queue)
    }
    func isFull() -> Bool {
        if self.queue.count-1 == self.queueCap{
            return true
        }else{
            return false
        }
    }
    func isEmpty() -> Bool {
        if self.queue.count == 0{
            return true
        }else{
            return false
        }
    }
    /* don't need to put mutating because class instances are reference values */
    func enqueue(value v: T) -> (){
        if (self.isFull()){
            print("Queue is full, cannot append \(v)")
        }
        else{
            self.queue.append(v)
        }
    }
    /* dequeuing will always take place in the front of the list */
    func dequeue(){
        if (self.isEmpty()){
            print("Cannot deqeue elements, queue is empty")
        }else{
            self.queue.remove(at: 0)
        }
    }
    func peek() -> T?{
        return self.topItem
    }
}
func queueArr(){
    let myQueue = qArr<Int>(hasCapacity: 10)
    myQueue.enqueue(value: 1)
    myQueue.enqueue(value: 2)
    myQueue.enqueue(value: 3)
    myQueue.printQueue()
    print(myQueue.peek()!)          // REMEMBER, YOU ALWAYS NEED TO UNWRAP OPTIONALS !!!
    myQueue.dequeue()
    myQueue.printQueue()
    print(myQueue.peek()!)
    myQueue.dequeue()
    myQueue.dequeue()
    myQueue.dequeue()
    
    
    
    
    let myQueue2 = qArr<String>(hasCapacity: 10)
    myQueue2.enqueue(value: "a")
    myQueue2.enqueue(value: "ab")
    myQueue2.enqueue(value: "ac")
    myQueue2.printQueue()
    print(myQueue2.peek()!)
}




// Linked List Implementation
class Node<T>{
private
    let value: T
    var NextNode: Node?
public
    init(hasValue value: T) {
        self.value = value
        self.NextNode = nil
    }
    func getNodeValue() -> T{
        return self.value
    }
    func link(nextNode node: Node<T>){
        self.NextNode = node
    }
}
class QueueLL<T>{
private
    let QCap: Int
    var topItem: T?{
        get{
            if self.head == nil{
                return nil
            }else{
                return self.head!.getNodeValue()
            }
        }
    }
    var itemCount: Int
    var head: Node<T>?
    var tail: Node<T>?
        
public
    init(hasCapacity v: Int) {
        self.QCap = v
        self.itemCount = 0
        self.head = nil
        self.tail = nil
    }
    func peek() -> T?{
        return topItem
    }
    func isEmpty() -> Bool{
        if self.itemCount == 0{
            return true
        }else{
            return false
        }
    }
    func isFull() -> Bool{
        if self.itemCount == self.QCap{
            return true
        }else{
            return false
        }
    }
    func enqueue(value v: T) -> (){
        let newNode = Node(hasValue: v)
        if (isEmpty()){
            self.head = newNode
            self.tail = newNode
            self.itemCount = self.itemCount + 1
        }
        else if (isFull()){
            print("Cannot enqueue value \(v) , queue is full.")
        }else{
            self.tail?.link(nextNode: newNode)
            self.tail = newNode
            self.itemCount = self.itemCount + 1
        }
    }
    func dequeue() -> (){
        if (isEmpty()){
            print("Cannot dequeue, queue is empty.")
        }else{
            var temp = self.head
            self.head = self.head?.NextNode  // this will be nil or another node
            temp = nil
            self.itemCount = self.itemCount - 1
        }
    }
    func printQueue() -> (){
        var temp = self.head
        while temp != nil{
            print("\(temp!.getNodeValue()) -> ","")
            temp = temp?.NextNode
        }
    }
}
func queueLL(){
    let myQ = QueueLL<Int>(hasCapacity: 10)
    myQ.enqueue(value: 1)
    myQ.enqueue(value: 2)
    myQ.enqueue(value: 3)
    myQ.printQueue()
    print(myQ.peek()!)
    
    let myQ2 = QueueLL<String>(hasCapacity: 10)
    myQ2.enqueue(value: "a")
    myQ2.enqueue(value: "b")
    myQ2.enqueue(value: "c")
    myQ2.printQueue()
}

func main(){
    //queueArr()
    queueLL()
  
}


main()

