//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        let email: String = emailTextfield.text!
        let password: String = passwordTextfield.text!
        
        Auth.auth().createUser(withEmail: email, password: password){
            authResult, error in
            if let e = error{
                print(e.localizedDescription)
            }
            else{
                // navigate to the chatviewcontroller
                self.performSegue(withIdentifier: K.registerSegue, sender: self)
            }
        }
    }
    
}
