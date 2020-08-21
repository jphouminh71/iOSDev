//
//  ChecklistItem.swift
//  todoApp
//
//  Created by Jonathan Phouminh on 7/9/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import Foundation


/* The purpose of this is just to define the object that we will be populating the tableview cells with. The only thing that this file handles is defining the structure of a checklist item */
class ChecklistItem: NSObject{
    @objc var text: String = ""
    var checked: Bool = false
    
    func configureCheckmark(){
        checked = !checked
    }
    
    func generateRandomTask() -> String {
        let randomTasks: [String] = ["walk shu", "get the grill", "go gardening", "plant trees"]
        return randomTasks[Int.random(in: 0 ... randomTasks.count-1)]
    }

}
