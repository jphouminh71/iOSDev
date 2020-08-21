//
//  TodoList.swift
//  todoApp
//
//  Created by Jonathan Phouminh on 7/10/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import Foundation

/* The purpose of this file is to handle the any logic that doesn't have anything to do with updating the actual views.  */

class TodoList{
    
    var todos: [ChecklistItem]
    
    init() {
        let row0Item = ChecklistItem()
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
        
        row0Item.text = "take a jog"
        row1Item.text = "watch a movie"
        row2Item.text = "listen to music"
        row3Item.text = "code an app"
        row4Item.text = "eat lunch"
        
        self.todos = [ChecklistItem]()
        self.todos.append(row0Item)
        self.todos.append(row1Item)
        self.todos.append(row2Item)
        self.todos.append(row3Item)
        self.todos.append(row4Item)
    }
    
    
    func newTodoItem() -> ChecklistItem{
        let item: ChecklistItem = ChecklistItem()
        item.text = item.generateRandomTask()
        item.checked = true
        todos.append(item)
        return item 
    }
    
    func move(item: ChecklistItem, to index: Int){
        guard let currentIndex = todos.firstIndex(of: item) else{
            return
        }
        todos.remove(at: currentIndex)
        todos.insert(item, at: index)
    }
    
    func remove(the items: [ChecklistItem]){
        for item in items{
            if let index = todos.firstIndex(of: item){
                todos.remove(at: index)
            }
        }
    }
}
