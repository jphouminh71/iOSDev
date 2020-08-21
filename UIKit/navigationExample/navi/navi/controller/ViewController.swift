//
//  ViewController.swift
//  navi
//
//  Created by Jonathan Phouminh on 7/8/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    
   
    @IBAction func trigger(_ sender: Any) {
        print("going to next screen")
        performSegue(withIdentifier: "next", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

