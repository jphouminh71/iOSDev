//
//  ViewController.swift
//  ContactsApplication_Sectioning
//
//  Created by Jonathan Phouminh on 7/13/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let twoDimensionalArray = [
        ["Amy", "Bill" , "Zach", "Jeni", "Jon"],
        ["Jack", "Garen", "Akali"],
        ["mark", "jeff", "elon", "Xavier"],
        ["Patrick", "Patty"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Contacts"
    }
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "header"
        label.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        return label
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        twoDimensionalArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "mycell", for: indexPath)
        
        
        var name = twoDimensionalArray[indexPath.section][indexPath.row]
        
        
        cell.textLabel?.text = "\(name)        SECTION: \(indexPath.section) ROW: \(indexPath.row)"
        return cell
    }

}

