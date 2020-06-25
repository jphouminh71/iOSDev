//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    // private just means that this variable can only be updated with functions in its current scope
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double{
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
//
//        guard let number = Double(displayLabel.text!)else{
//            fatalError("Cannot convert display label text to number")
//        }
        
        if let calcMethod = sender.currentTitle{  // if the calcMethod button pressed isn't nil
            switch calcMethod {
            case "+/-":
                displayValue *= -1
            case "AC":
                displayLabel.text = "0"
            case "%":
                displayValue *= 0.01
            default:
                print("you gave me a bad expression")
            }
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
    
        if let numValue = sender.currentTitle{
            if (isFinishedTypingNumber){
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else{
                
                if (numValue == "."){
                    guard let currentDisplayValue = Double(displayLabel.text!) else{
                        fatalError("Cannot convert the current label \(displayLabel.text!) to a Double")
                    }
                    ///* all we are doing here is just checking if have already entered a decimal in our current number
                    let isInt: Bool = floor(currentDisplayValue) == currentDisplayValue
                    if(!isInt){
                        return
                    }
                }
                displayLabel.text = String(displayValue) + numValue
            }
        }
    }

}

