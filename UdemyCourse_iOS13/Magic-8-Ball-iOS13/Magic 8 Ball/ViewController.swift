//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // setting up the IBOutlet Connections
    @IBOutlet weak var EightBallImageView: UIImageView!
    
    let ballArray = [#imageLiteral(resourceName: "ball2"),#imageLiteral(resourceName: "ball5"),#imageLiteral(resourceName: "ball1"),#imageLiteral(resourceName: "ball4"),#imageLiteral(resourceName: "ball5")]
    
    
    
    // implementing action button function
    @IBAction func didPressButton(_ sender: UIButton) {
        let randomNumber = Int.random(in: 0...4)
        EightBallImageView.image = ballArray[randomNumber]
    }
    

}

