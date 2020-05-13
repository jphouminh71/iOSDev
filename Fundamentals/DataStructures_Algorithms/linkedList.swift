import UIKit

/* Singly linked list implementation
    isEmpty()
    Length()
    addNode()
    deleteNode()
    search()
    printList()
 
  Notes about memory:
    ARC tracks how many properties, constants, and variables are currently referring to each class instance.
    ARC will not deallocate an instance as long as at least one active reference to that instance still exists
    
 */
func linkedList(){
    /* basic node constructor */
    /* using a class so you can have built in functions that each instance can use */
    class Node{
        /* remember you have to unwrap these when you actually want to get to the value */
        var value: Int?     // integer or Nil
        weak var nextNode: Node?   // weak reference to prevent memory leaks
        
        
        /* initializers */
        init(valueOfNode value:Int){
            self.value = value
            self.nextNode = nil
        }
        /* deinitializer , nodes will properly be deallocated if this prints */
        deinit {print("deinitializing the node with the value: \(self.value ?? -99)")}
        
        
        /* functions to update */
        func updateValue(updateWith val: Int){
            self.value = val
        }
        
        /* print the contents of the node , have to unpack it*/
        func printContents(){
            if (self.value! != nil){
                if (self.nextNode != nil){
                    if (self.nextNode!.value! != nil){
                        print("VALUE: ", self.value!, " NextNode: ", self.nextNode!.value! )
                    }else{
                        print("VALUE: ", self.value!, " NextNode: nil")
                    }
                }
            }else{
                print("The node is empty.")
            }
        }
    }
    
    class SinglyLinkedList{
        var head: Node?
        var tail: Node?
        var count: Int?
        
    }
    /* uncomment these to create the linkedList */
    
    
    /* test functions to when creating nodes */
    var one: Node? = Node(valueOfNode: 1)
    one!.printContents()

    one = nil
}

/* uncomment these to run the functions */
linkedList()




/* everything below here is just you playing around with the syntax. */
func testFunctions(){
    class Point{
        var x: Int, y:Int
        init(){
            self.x = 0
            self.y = 0
        }
        
        func SetPoint(_ xPoint: Int, _ yPoint: Int){
            self.x = xPoint
            self.y = yPoint
        }
        
        func printCoordinates(){
            print("X: ", self.x)
            print("Y: ", self.y)
        }
    }
    //
    //var x = Point()
    //x.printCoordinates()
    //
    //x.SetPoint(1, 1)
    //x.printCoordinates()


    struct anotherPoint{
        var x: Int, y: Int
        
        mutating func moveBy(_ shiftX: Int, _ shiftY: Int){
            self.x = self.x + shiftX
            self.y = self.y + shiftY
        }
        func printPoints(){
            print("X: ", self.x)
            print("Y: ", self.y)
        }
    }

    var y = anotherPoint(x: 0, y: 0)
    y.printPoints()

    y.moveBy(1, 1)
    y.printPoints()
}

