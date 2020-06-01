// AUTHOR: Jonathan Phouminh
// Date: May 31st, 2020
// This will be an implementation of a minheap, use heaps when you want to access minimum and maximum values of a number set in the fastest time possible.
import UIKit

/* min heap notes:
        After insertion: Insert the element at the very end , then heapify it upwards
        After removal: Remove the first element then take the last element and put it to the top, then heapify it downwards
 
    Supporting functions
                    These functions will make it easy for us to retrieve values when we are heapifying
        getParentIndex(childIndex) -> Index
        getLeftChild(parentIndex)  -> Index
        getRightChild(parentIndex) -> Index
 
                    These functions will be used to see if a node has members
        hasLeftChild(parentIndex) -> Bool
        hasRightChild(parentIndex) -> Bool
        hasParent(childIndex) -> Bool
 
                    These functions are the main operations for our minheap
        heapifyDown() -> just modifies the array , use this after performing a removal
        heapifyUp() -> just modifies the array, use this after performing an insertion
        swap(index1, index2) -> modifies the array, swaps to elements
        removeElement()
        insertElement()
        printHeap
 */
class MinHeap{
private
    let heapCapacity: Int
    var currentSize: Int
    var array: [Int]
public
    func initializeTestArray() -> (){
        for i in 0...heapCapacity-1{
            self.array.append(i)  // don't increment here because we are already at index 1
        }
    }
    
    init(hasCapcity cap: Int) {
        self.heapCapacity = cap
        self.array = [-1]   // filling in index 0 with a trash value
        self.currentSize = 1   // start it at one so that the math works out
    }
    
    /* helper functions */
    func swap(_ indexOne: Int, _ IndexTwo: Int) -> (){
        let temp = self.array[indexOne]
        self.array[indexOne] = self.array[IndexTwo]
        self.array[IndexTwo] = temp
    }
    func printHeap() -> (){
        print("---------------")
        print("Heap capacity: \(self.heapCapacity)")
        print("Current heap size: \(self.currentSize)")
        print(self.array)
    
    }
    /* these functions are here just so they can return us the corresponding indexes  */
    func getParentIndex(childIndex child: Int) -> Int{
        return child / 2
    }
    func getLeftChildIndex(parentIndex parent: Int) -> Int{
        return parent * 2
    }
    func getRightChildIndex(parentIndex parent: Int) -> Int{
        return (parent*2) + 1
    }
    
    /* you will be using the function during your heapifying */
    func hasParent(childIndex child: Int) -> Bool{
           let index = getParentIndex(childIndex: child)
           return index >= 1
    }
    
    /* these are for heapify downwards */
    func hasLeftChild(parentIndex parent: Int) -> Bool{
        let index = getLeftChildIndex(parentIndex: parent)
        return index < currentSize
    }
    func hasRightChild(parentIndex parent: Int) -> Bool{
        let index = getRightChildIndex(parentIndex: parent)
        return index < currentSize
    }
   
    /* more helper functions  */
    func isFull() -> Bool{
        if (self.currentSize == self.heapCapacity){
            return true
        }else{
            return false
        }
    }
    func isEmpty() -> Bool{
        if (self.array.count == 1){  // if only the garbage value is in there
            return true
        }else{
            return false
        }
    }
    
    
    /* for this all we have to do is insert the element add the end and proceed bubbling it up to where it belongs */
    func insert(value v: Int) -> (){
        if (isFull()){
            print("Cannot insert value: \(v) , the heap is full")
        }
        else if (isEmpty()){
            self.array.append(v)
            // index one now corresponds to the actual first element so we don't need to increment
        }
        else{
            self.array.append(v)   // add it to the bottom
            self.currentSize += 1
            heapifyUpHelper()          // bubble it up
        }
    }
    /* this function will be called just after an element has been added. /
        essentially, we just have to keep checking to make sure that the parent is no larger than the current node itself. If the parent is larger, then swap the items.
        Should always be starting at the most recent index.
     */
    func heapifyUpHelper() -> (){       // added this function just so we can pass the initial index of the child
        heapifyUp(self.currentSize)
    }
    func heapifyUp(_ childIndex: Int) -> (){
        if (hasParent(childIndex: childIndex)){
            let parentIndex: Int = getParentIndex(childIndex: childIndex)
            if self.array[parentIndex] > self.array[childIndex]{
                swap(parentIndex, childIndex)
                heapifyUp(parentIndex)
            }else{
                return
            }
        }else{
            return
        }
    }
    
    // could throw an error, but just for this purpose, we are just going to assert an error and stop the program
       func extract() -> Int {
           if (isEmpty()){
               assert(isEmpty() == false, "Heap is empty, nothing to remove")
               return -99999
               
           }
           else if(self.currentSize == 1){   // have to remember that we did not actually incrememnt after adding the first item , so we don't decrement currentSize, just pop
            let element = self.array[1]
            self.array.popLast()
            return element
            
           }
           else{
            let returnItem = self.array[1]
            swap(1, self.currentSize)
            self.array.popLast()
            heapifyDownHelper()   // restore the heap after the removing the top element
            self.currentSize = self.currentSize - 1     // you decrement after restoring the heap because since you start at 1 you don't want to mess up the indexes during heapifyD
            return returnItem
           }
       }
    func heapifyDownHelper() -> (){
        heapifyDown(1)
    }
    /* essentially, we heapify downwards if the child nodes are LESS than the current parent, we want to bubble down */
    func heapifyDown(_ parentIndex: Int) -> (){
        /* 2 children, need to check to see which one is bigger  */
        if (hasLeftChild(parentIndex: parentIndex) && hasRightChild(parentIndex: parentIndex)){
            let leftChild = getLeftChildIndex(parentIndex: parentIndex)
            let rightChild = getRightChildIndex(parentIndex: parentIndex)
            // if the two children are equal, just pick the right child to swap with
            if (self.array[leftChild] == self.array[rightChild]){
                swap(parentIndex, rightChild)   // so we just put the value in the place of the rightChilds previous index
                heapifyDown(rightChild)
            }
            // if the left one is smaller
            else if (self.array[leftChild] < self.array[rightChild]){
                swap(parentIndex, leftChild)
                heapifyDown(leftChild)
            }
            // if the right one is smaller
            else{
                swap(parentIndex, rightChild)
                heapifyDown(rightChild)
            }
        }
        /* only the left child */
        else if (hasLeftChild(parentIndex: parentIndex) && !hasRightChild(parentIndex: parentIndex)){
            let leftChild = getLeftChildIndex(parentIndex: parentIndex)
            if (self.array[leftChild] < self.array[parentIndex]){
                swap(parentIndex, leftChild)
                heapifyDown(leftChild)
            }
            else{
                return
            }
        }
        /* only a right child */
        else if (hasRightChild(parentIndex: parentIndex) && !hasLeftChild(parentIndex: parentIndex)){
            let rightChild = getRightChildIndex(parentIndex: parentIndex)
            if (self.array[rightChild] < self.array[parentIndex]){
                swap(rightChild, parentIndex)
                heapifyDown(rightChild)
            }else{
                return
            }
        }
        /* no children */
        else{
            return
        }
    }
}
func minHeap(){
    let heapy = MinHeap(hasCapcity: 10)
    heapy.insert(value: 20)
    heapy.insert(value: 11)
    heapy.insert(value: 10)
    heapy.printHeap()
    
    heapy.extract()
    heapy.printHeap()
    


///* Empty extraction test
//heapy.extract()   // expecting an error since heap is empty at this call
    
    
///* Single element extraction test, should just be straightforward and array should just be empty
//    heapy.insert(value: 1)
//    let v = heapy.extract()
//    print("Extracted value: \(v)")
//    heapy.printHeap()  // [-1]
    
    
///* Two element extraction test
//    heapy.insert(value: 1)
//    heapy.insert(value: 2)
//    let extractedValue = heapy.extract()
//    print("Extracted Value: \(extractedValue)")   // expecting the value 1
//    heapy.printHeap()  // expecting [-1, 2]
    
///* Three element extraction test
//    heapy.insert(value: 10)
//    heapy.insert(value: 20)
//    heapy.insert(value: 1)
//    heapy.insert(value: 11)
//    heapy.insert(value: -1)
//
//    print("")
//    print("Heap Before Extraction \(heapy.array)")
//    print("Current heap size: \(heapy.currentSize)")
//    let extractedValue = heapy.extract()
//    print("Extracted Value: \(extractedValue)")   // expecting the value 1
//    heapy.printHeap()
//    print("")
//
//    print("")
//    print("Heap Before Extraction \(heapy.array)")
//    print("Current heap size: \(heapy.currentSize)")
//    let extractedValue2 = heapy.extract()
//    print("Extracted Value: \(extractedValue2)")
//    print("Heap after Extraction \(heapy.array)")
//    print("")
//
//    print("")
//    print("Heap Before Extraction \(heapy.array)")
//    print("Current heap size: \(heapy.currentSize)")
//    let extractedValue3 = heapy.extract()
//    print("Extracted Value: \(extractedValue3)")
//    print("Heap after Extraction \(heapy.array)")
//    print("")
//
//    print("")
//    print("Heap Before Extraction \(heapy.array)")
//    print("Current heap size: \(heapy.currentSize)")
//    let extractedValue4 = heapy.extract()
//    print("Extracted Value: \(extractedValue4)")
//    print("Heap after Extraction \(heapy.array)")
//    print("")
//
//    print("")
//    print("Heap Before Extraction \(heapy.array)")
//    print("Current heap size: \(heapy.currentSize)")
//    let extractedValue5 = heapy.extract()
//    print("Extracted Value: \(extractedValue5)")
//    print("Heap after Extraction \(heapy.array)")
//    print("")

    
///* insertion test 1*/
//    heapy.insert(value: 1)
//    heapy.insert(value: 0)
//    heapy.printHeap()   // [-1 , 0, 1]
//    heapy.insert(value: -1)
//    heapy.printHeap()   // [-1, -1 ,1,0]
//    heapy.insert(value: -10)
//    heapy.printHeap()
//    heapy.insert(value: -100)
//    heapy.printHeap()
    
///* insertion test 2 */
//    heapy.printHeap()
//    heapy.insert(value: 1)
//    heapy.printHeap()
//    heapy.insert(value: 2)
//    heapy.printHeap()      // Array is expected to be [-1, 1, 2]
//    heapy.insert(value: 3)
//    heapy.printHeap()       // Array is expected to be [-1, 1, 2, 3]
//    heapy.insert(value: 0)
//    heapy.printHeap()       // Array is expected to be [0,1,3,2]

    
///*                      testing other functions will these
//    heapy.swap(0, 9)
//    print(heapy.getParentIndex(childIndex: 2))  // [0,1,2,3]
//    print(heapy.hasParent(childIndex: 1))  // asking to give me the parent of element: 0, expecting false
//    print(heapy.hasLeftChild(parentIndex: 1)) // asking to give me the left child of element: 0, expecting true
//    print(heapy.hasRightChild(parentIndex: 1)) // asking to give me the right child of element: 0, expecting true
//    print(heapy.hasParent(childIndex: 3))
//    print(heapy.hasParent(childIndex: 2))
//
    
}
func main(){
    minHeap()
}
main()

