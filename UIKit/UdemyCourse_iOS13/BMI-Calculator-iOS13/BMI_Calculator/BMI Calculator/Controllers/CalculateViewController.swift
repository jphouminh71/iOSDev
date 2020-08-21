//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain: CalculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculatorBrain.getBMIValue()
    }
    
    /* IBAction for the labels */
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    /* IBAction for the sliders */
    @IBOutlet weak var heightSliderChange: UISlider!
    @IBOutlet weak var weightSliderChange: UISlider!
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        if (sender.tag == 1){
            let value: String = String(format: "%.2f",sender.value)
            heightLabel.text = value + "m"
            
        }else{
            let value: String = String(Int(sender.value))
            weightLabel.text = value + "kg"
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height: Float = heightSliderChange.value
        let weight: Float = weightSliderChange.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    /* this function lets us pass a reference for this object to the next screen*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult"){
            // we are downcasting the returned viewController into the ResultViewController class
            // so that we are able to have access to its properties for us to set
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.calculatedBMI = calculatorBrain.passMe()
            
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
//            destinationVC.adviceLabel = calculatorBrain.getAdvice()
//            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

