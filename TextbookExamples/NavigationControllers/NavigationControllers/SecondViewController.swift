//
//  SecondViewController.swift
//  NavigationControllers
//
//  Created by Jonathan Phouminh on 7/22/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit


protocol SecondVCProtocol {
    func passBackInformation(_ SecondVC: SecondViewController, _ text: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var passedText: String?
    var textToPassBack:String = "PassedBackInformation"
    
    var SecondVCDelegate: SecondVCProtocol? 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = passedText {
            textLabel.text = text
        }
        
        configureNavigation()
    }
    
    func configureNavigation() {
        
    }
    
    
    
    
    
    @IBAction func passBackBtnPressed(_ sender: UIButton) {
        // all we want to do here is call the delegate method here and pass a reference to ourself
        
    }
    
}
