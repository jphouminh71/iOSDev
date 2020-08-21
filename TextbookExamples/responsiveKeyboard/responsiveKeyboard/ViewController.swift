//
//  ViewController.swift
//  responsiveKeyboard
//
//  Created by Jonathan Phouminh on 7/21/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

/*
    Small application that supports a keyboard that is responsive to touch commands and will fire functions based of notifcations sent to the viewController via making the viewController an observer object
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputField1: UITextField!
    @IBOutlet weak var inputField2: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mybutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        
        // configuring loading indicator
        activityIndicator.hidesWhenStopped = true
        
        inputField1.delegate = self
        inputField2.delegate = self
        
        // any time the name of a notification is recognized by the viewcontroller, it will fire 'showKeyboard'
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        // adding a tap gesture
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        mybutton.setTitle("Buttons-Switches-SegmentedControls", for: .normal)
        print(mybutton.currentTitle)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
        isEditing = false
    }
    
    @objc func showKeyboard(notification: NSNotification) {
        // i want to take everything on the view currently and translate it up by the size of the keyboard
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            if (self.view.frame.origin.y == 0){
                self.view.frame.origin.y = -keyboardSize.height  // have to flip it because of the origin of apple screens
            }
        }
    }
    
    // NSNotication, just think of it as a signal that is automatically sent when triggered
    @objc func hideKeyboard(notification: NSNotification){
        // i want to remove the keyboard from the view and shift eveything back down based on that keyboard's height
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil { // detecting a keyboard frame
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
    
    func configureNavi() {
        // placing a button to take us to the next screen
        let nextBtn = UIBarButtonItem(title: K.firstSegue, style: .plain, target: self, action: #selector(jumpScreens))
        navigationItem.rightBarButtonItem = nextBtn
    }
    
    @objc func jumpScreens() {
        performSegue(withIdentifier: K.firstSegue, sender: self)
        // remember that if you wanted to do some data handling you can set up the 'prepareSegueMethod'
    }
    
    
    @IBAction func button1Pressed(_ sender: Any) {
        performSegue(withIdentifier: K.thirdScreen, sender: self)
    }
    

}

// side note: Extensions cannot contain stored properties
// this is needed so that we can actual make the return key responsive
extension ViewController: UITextFieldDelegate {
    
    // this makes the keyboard end on the return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activityIndicator.startAnimating()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activityIndicator.stopAnimating()
    }
    
    
}


