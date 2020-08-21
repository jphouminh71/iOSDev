//
//  Alert&PickerViewController.swift
//  GestureRecognizing
//
//  Created by Jonathan Phouminh on 7/21/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class Alert_PickerViewController: UIViewController {

    
    @IBOutlet weak var pickerBtn: UIButton!
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var textLabel: UILabel!
    
    let dateFormatter = DateFormatter()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.numberOfLines = 0 // allows for unlimted lines of input
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        pickerBtn.isEnabled = true
        datepicker.isEnabled = false
        
    }
    

    @IBAction func buttonTapped(_ sender: Any) {
        
        // setting up an alert that will pop up immediately once the view loads
        
        let alert = UIAlertController(title: "ZOMBIES INCOMING", message: "kill them", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "SELF DESTRUCT", style: .destructive, handler: {
            action -> Void in print(action.title!)
        })
        let alertAction2 = UIAlertAction(title: "RUN AWAY", style: .default, handler: {
            action -> Void in
                // if the user clicks this option we want to capture the text and save it in our label
            let savedText = alert.textFields![0]
            self.textLabel.text = savedText.text
        })
        
        alert.addTextField { (textField) in
            textField.placeholder = "enter code"
            textField.isSecureTextEntry = true
            
            // to make this fully functioning text field, what you would want to do is also add text field delegates and such to handle a properly working keyboard
        }
        
        alert.addAction(alertAction)
        alert.addAction(alertAction2)
        self.present(alert,animated: true, completion: nil)
    }
    
    
    @IBAction func datePicked(_ sender: UIDatePicker) {
        let dateString = dateFormatter.string(from: sender.date)
        let alert = UIAlertController(title: "You entered the following date", message: dateString, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        alert.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func pickerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "picker", sender: self)
    }
    
}
