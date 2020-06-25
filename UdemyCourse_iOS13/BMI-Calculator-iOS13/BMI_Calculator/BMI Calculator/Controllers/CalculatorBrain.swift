//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Jonathan Phouminh on 6/9/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain{
private
    var calculatedBMI: BMI?

public
    
    /* Since our properities are let, we will just replace the object with completely new one entirely */
    mutating func calculateBMI(height h: Float, weight w: Float) -> (){
        let BMItoDecimalPlace: Float = w / pow(h,2)
        
        if (BMItoDecimalPlace < 18.5){
            calculatedBMI = BMI(value: BMItoDecimalPlace, advice: "Eat more pies", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        }
        else if (BMItoDecimalPlace < 24.90){
            calculatedBMI = BMI(value: BMItoDecimalPlace, advice: "Fit as fiddle!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        }
        else{
            calculatedBMI = BMI(value: BMItoDecimalPlace, advice: "Eat less pies!", color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        }
    }
    
    func getBMIValue() -> String{
        let value: Float? = self.calculatedBMI?.value
        return String(format:"%.1f" , value ?? 0.0)
    }
    
    func passMe() -> BMI{
        return calculatedBMI!
    }
}
