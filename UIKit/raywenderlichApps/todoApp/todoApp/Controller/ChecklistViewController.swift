//
//  ViewController.swift
//  todoApp
//
//  Created by Jonathan Phouminh on 7/9/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//  mvc design pattern

/* The purpose of this file is to strictly handle the logic that will ultimately effect the rendering of the UIViews */

import UIKit

class ChecklistViewController: UITableViewController {
    
    var todoList : TodoList       // object that handles logic not involving updating UI
    
    // 2d array of checklist of items so that we can organize our data into sections
    var tableData: [[ChecklistItem?]?]!
    
    required init?(coder aDecoder: NSCoder) {
        todoList = TodoList()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureNavigationBar()
        tableView.allowsMultipleSelectionDuringEditing = true
        
        
        // setting up the sectioning  , have no idea what this is doing
        let sectionTitleCount = UILocalizedIndexedCollation.current().sectionTitles.count
        var allSections = [[ChecklistItem?]?](repeating: nil, count: sectionTitleCount)   // initializes array
        var sectionNumber = 0
        let collation = UILocalizedIndexedCollation.current()
        for item in todoList.todos{
            sectionNumber = collation.section(for: item, collationStringSelector: #selector(getter:ChecklistItem.text))
            if (allSections[sectionNumber] == nil){
                allSections[sectionNumber] = [ChecklistItem?]()
            }
            allSections[sectionNumber]!.append(item)
        }
        tableData = allSections
        
    }
    
    func configureNavigationBar(){
        // configuring the title text for this screen
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Checklist App"
        
        // configuring the right button to add items , if we do it this way, we don't need to create an entire outlet for the screen.
        let addBtn: UIBarButtonItem = UIBarButtonItem(title: "Add Item +", style: .plain, target: self, action: #selector(inputItem))
        
        let deleteBtn: UIBarButtonItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteItem))
        self.navigationItem.setRightBarButtonItems([addBtn, deleteBtn], animated: true)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
    
    // MARK: - PREPARE FOR SEGUE
    // THIS IS WHERE WE BECOME A DELAGATE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeToInput"{
            if let addItemVC = segue.destination as? ItemDetailViewController{
                addItemVC.delegate = self
                addItemVC.todoList = todoList
            }
        }
        else if segue.identifier == "DisclosureToEdit"{
            if let addItemVC = segue.destination as? ItemDetailViewController{
                if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell){
                    let item = todoList.todos[indexPath.row]
                    addItemVC.itemToEdit = item
                    addItemVC.delegate = self
                }
            }
        }
    }

    // MARK: - setting up the prototype cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing {      // have to intercept here because the we are selecting during the editing process too
            return
        }
        if let cell: UITableViewCell = tableView.cellForRow(at: indexPath){
            let item = todoList.todos[indexPath.row]
            item.configureCheckmark()
            configureCheckmark(cell, item)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}


// These are the methods, the itemDetailViewController will come to when these delegate methods are called
extension ChecklistViewController: ItemDetailViewControllerDelegate{
    
    // these are methods that we must implement that are defined in the protocol so we must implement them.
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem) {
        navigationController?.popViewController(animated: true)
        let rowIndex = todoList.todos.count
        todoList.todos.append(item)
        let indexPath = IndexPath(row: rowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditiing item: ChecklistItem) {
        
        if let index = todoList.todos.firstIndex(of: item){
            todoList.todos[index].text = item.text
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath){
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    
}

// MARK: - EDITING / MOVING CELLS AROUND
extension ChecklistViewController {
    
    // this enables the "edit" icon in the top left of the view controller
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableView.setEditing(tableView.isEditing, animated: true)
    }
    
    // this is what enables us to move rows around while we are in the edit mode
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let item = todoList.todos[sourceIndexPath.row]
        todoList.move(item: item, to: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: ChecklistTableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todoList.todos.remove(at: indexPath.row)  // removing the from data model array
        let indexPaths = [indexPath]   // removing from the view
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
}

//MARK: - DATA SOURCE METHODS, configures the table metadata
extension ChecklistViewController{
    //this methods gets called for when .insertRows() is called
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = todoList.todos[indexPath.row]

        configureText(for: cell, with: item)
        configureCheckmark(cell, item)
        return cell
    }
}

//MARK: - CELL CONFIGURATION
extension ChecklistViewController{
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem){
        if let checkmarkCell = cell as? ChecklistTableViewCell{
            checkmarkCell.todoTextLabel.text = item.text
        }
    }

    func configureCheckmark(_ cell: UITableViewCell, _ item: ChecklistItem){
        
        guard let checkmarkCell = cell as? ChecklistTableViewCell else {
            return
        }
        
        switch item.checked {
        case true:
            checkmarkCell.checkmarkLabel.text  = "√"
        default:
            checkmarkCell.checkmarkLabel.text  = ""
        }
    }
}

// MARK: - IB ACTIONS
extension ChecklistViewController {
    
    /// delete button action
    @objc func deleteItem (){
        if let selectedRows = tableView.indexPathsForSelectedRows {
            var items = [ChecklistItem]()
            for indexPath in selectedRows{
                items.append(todoList.todos[indexPath.row])
            }
            todoList.remove(the: items)  // we have now updated the model
            tableView.beginUpdates()  // this is like making the process safe so that no race conditions are created
            tableView.deleteRows(at: selectedRows, with: .automatic)
            tableView.endUpdates()
            print("im here")
        }
    }
    /// Useer input version
    @objc func inputItem(){
        performSegue(withIdentifier: "HomeToInput", sender: self)
    }
    
    /// Hard coded version
    @objc func addItem(){
        let nextRowIndex = todoList.todos.count
        _ = todoList.newTodoItem()
        
        let indexPath = IndexPath(row: nextRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)  // this is phsyically adding the todo item on the screen NOT the model
        
        // tableView.insertRows  , you could also do this, but runtime is a thing so use the method above.
    }
}


//MARK: - Setting up sectioning 
extension ChecklistViewController {
    
}
