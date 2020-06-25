//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // This is where you declare all the variables for all the view objects
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // after we load, we want to change the image's on the dice
        // imageLiteral , <-- a manual way to change images
        // not a way to change it dynamically
        diceImageView1.image = #imageLiteral(resourceName: "DiceFive")
        diceImageView2.image = #imageLiteral(resourceName: "DiceFive")
        
    }
    
    // This code will be triggered when the roll button is triggered
  
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        // load an array of imageLiterals and randomly select from them
        let diceFaceArray = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
        let randomNumber = Int.random(in: 0...5)
        let randomNumber2 = Int.random(in: 0...5)
        
        // dynamically setting the image objects
        diceImageView1.image = diceFaceArray[randomNumber]
        diceImageView2.image = diceFaceArray[randomNumber2]
    }
    
    
    
    


}

