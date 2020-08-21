//
//  ViewController.swift
//  product_discount
//
//  Created by Jonathan Phouminh on 7/16/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let exampleProduct = Product("clorox", 10.00)
        print(exampleProduct.calculateDiscount(0.1))
    }


}

