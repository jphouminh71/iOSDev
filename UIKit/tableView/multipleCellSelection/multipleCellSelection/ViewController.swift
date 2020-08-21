//
//  ViewController.swift
//  multipleCellSelection
//
//  Created by Jonathan Phouminh on 7/13/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.allowsMultipleSelectionDuringEditing = true
//        configureNav()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.allowsMultipleSelection = true
        tableView.allowsMultipleSelectionDuringEditing = true
        configureNav()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let label = cell?.viewWithTag(1) as? UILabel
        label?.text = "\(indexPath.row)"
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing{
            return
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension ViewController {
    func configureNav(){
        navigationItem.leftBarButtonItem = editButtonItem
    }
}

