//
//  Brain.swift
//  TodoApp
//
//  Created by Jonathan Phouminh on 7/9/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import Foundation
import UIKit


// you only want to use classes when you want to introduce inheritance
struct Brain {
    
    func loadMockData() -> [TodoItem] {
        var tasks: [TodoItem] = [TodoItem]()
        let items = ["walk dog" , "eat food" , "workout", "make shake", "take a nap" , "play league"]
        for thing in items{
            tasks.append(TodoItem(task: thing, completion: false))
        }
        return tasks
    }
}
