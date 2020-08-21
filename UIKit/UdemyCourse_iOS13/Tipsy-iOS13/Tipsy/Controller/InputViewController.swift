//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /* Bill total label */
    @IBOutlet weak var billTotalLabel: UITextField!
    
    /* Percentage labels */
    @IBOutlet weak var zeroPercentLabel: UIButton!
    @IBOutlet weak var tenPercentLabel: UIButton!
    @IBOutlet weak var twentyPercentLabel: UIButton!
    
    /* split count label */
    @IBOutlet weak var splitCountLabel: UILabel!
    
    
    var newBill: Bill = Bill()
    
    
    @IBAction func percentagePressed(_ sender: UIButton) {
        switch sender.titleLabel?.text{
            case "0%":
                billTotalLabel.endEditing(true)
                newBill = Bill(billAmount: Double(billTotalLabel.text!), tip: 0.0)
            case "10%":
                billTotalLabel.endEditing(true)
                newBill = Bill(billAmount: Double(billTotalLabel.text!), tip: 0.1)
            case "20%":
                billTotalLabel.endEditing(true)
                newBill = Bill(billAmount: Double(billTotalLabel.text!), tip: 0.2)
            default:
                print("bad input")
        }
        updateUI()
    }
    
    
    /* differentiate increment or decrement by comparing with current text field */
    @IBAction func stepperPressed(_ sender: UIStepper) {
        if (sender.value < newBill.splitCount){
            newBill.decreaseSplitCount()
        }else{
            newBill.increaseSplitCount()
        }

        updateSplitCountUI()
    }
    
    /* essentially the only thing we are going to be updating here is the tip background */
    func updateUI() -> (){
        switch newBill.tip! {
        case 0.0:
            // set the zero background color and clear the rest
            zeroPercentLabel.isSelected = true
            tenPercentLabel.isSelected = false
            twentyPercentLabel.isSelected = false
        case 0.1:
            // set the 10 percent background
            zeroPercentLabel.isSelected = false
            tenPercentLabel.isSelected = true
            twentyPercentLabel.isSelected = false
        case 0.2:
            // set the 20 percent background
            zeroPercentLabel.isSelected = false
            tenPercentLabel.isSelected = false
            twentyPercentLabel.isSelected = true
        default:
            assert(true == false, "something went wrong in the updateUI")
        }
    }
    
    func updateSplitCountUI() -> (){
        splitCountLabel.text = String(Int(newBill.splitCount))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.costPerPerson = String(newBill.costPerPerson)
            destinationVC.tip = String(Int(newBill.tip! * 100))
            destinationVC.splitCount = String(Int(newBill.splitCount))
        }
    }
    
    
    
}

