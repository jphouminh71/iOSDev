//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Jonathan Phouminh on 6/9/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    /* creating bmi property so we can pass it over */
    var bmiValue: String?
    var calculatedBMI: BMI = BMI(value: 0.0, advice: "String", color: .red)
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value: Float = calculatedBMI.value
        bmiLabel.text = String(format: "%.2f", value)
        adviceLabel.text = calculatedBMI.advice
        view.backgroundColor = calculatedBMI.color
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        // dismisses the current view present 
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
