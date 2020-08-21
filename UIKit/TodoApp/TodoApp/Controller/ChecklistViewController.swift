//
//  ViewController.swift
//  TodoApp
//
//  Created by Jonathan Phouminh on 7/9/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController{

    var tasks: [TodoItem] = [TodoItem]()
    var taskbrain = Brain()
    
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavigationBar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tasks = taskbrain.loadMockData()
    }
    
    func configureNavigationBar(){
        
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)  // this changes all button tints
        // this is how you set the title for this specific screen
        navigationItem.title = "My Checklist App"

        // create the right button
        let addBtn: UIBarButtonItem = UIBarButtonItem(title: "Add Item +", style: .plain, target: self, action: #selector(jumpScreens)) // configure this to trigger segue
        navigationItem.rightBarButtonItem = addBtn
    
    }
    
    @objc func jumpScreens() -> (){
        performSegue(withIdentifier: "BoardToInput", sender: self)
    }
    
    @objc func addDummyItem() -> (){
        let dummyTask = TodoItem(task: "dummy", completion: true)
        tasks.append(dummyTask)
        self.tableView.reloadData()
    }
}


// this would be the tableviewdelegateMethods
extension ChecklistViewController{
    func configureCell(_ cell: UITableViewCell, _ index: IndexPath) -> UITableViewCell{
        
        if tasks.count > 0 {
            let configuredCell: UITableViewCell = cell
            // for tableview cells you have to remember that everything is encapsulated within views so to get the label you actually need to find it.
            if let label = configuredCell.viewWithTag(100) as? UILabel{
                label.text = tasks[index.row].task
            }
            configuredCell.accessoryType = .none
            configuredCell.tintColor = UIColor(red: 100, green: 0, blue: 100, alpha: 1) // changing tint of checkmarke
            return configuredCell
        }
        else{
            return cell
        }
    }
    
    // this is where you would handle the interaction for when the user taps on the cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        switch  cell.accessoryType{
        case .checkmark:
            cell.accessoryType = .none
        case .none:
            cell.accessoryType = .checkmark
        default:
            print("bad")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ChecklistViewController{
    // telling the uitable how many rows we want in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // creating the reusable cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let configuredCell: UITableViewCell = configureCell(mycell, indexPath)
        return configuredCell
    }
}

