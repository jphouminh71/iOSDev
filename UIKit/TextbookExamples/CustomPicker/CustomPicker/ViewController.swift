//
//  ViewController.swift
//  CustomPicker
//
//  Created by Jonathan Phouminh on 7/21/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var myPicker: UIPickerView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
        print("view loaded")
        myPicker.delegate = self
        myPicker.dataSource = self   // usually you would make this equal to an object that encapsulates the data
    }
       
    
    let animals = ["Cat", "Dog", "Horse", "Elephant"]
    let foods = ["Cat food", "Dog food", "Horse food", "Elephant food", "Generic Food"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return animals.count
        case 1:
            return foods.count
        default:
            return 19
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            // set up the animals in the first
            return animals[row]
        case 1:
            // set up the foods in the second
            return foods[row]
        default:
            return ""
        }
    }
    
    func retrievePickerInformation() {
        let pickedAnimal = myPicker.selectedRow(inComponent: 0)
        let pickedFood = myPicker.selectedRow(inComponent: 1)
        
        print("You picked \(foods[pickedFood]) for the animal: \(animals[pickedAnimal]) ")
    }

   
    @IBAction func retrivePickerInfo(_ sender: UIButton) {
        retrievePickerInformation()
    }
    
}

