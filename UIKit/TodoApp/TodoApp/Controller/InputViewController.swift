//
//  InputViewController.swift
//  TodoApp
//
//  Created by Jonathan Phouminh on 7/9/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class InputViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
    }
    
    func configureNavigation() -> () {
        let addBtn = UIBarButtonItem(title: "Add Item", style: .plain, target: self, action: #selector(dismissView))
        addBtn.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 100, green: 0, blue: 100, alpha: 1)], for: .normal)
        navigationItem.rightBarButtonItem = addBtn
    }
    
    @objc func dismissView(){
        navigationController?.popViewController(animated: true)
    }
}
