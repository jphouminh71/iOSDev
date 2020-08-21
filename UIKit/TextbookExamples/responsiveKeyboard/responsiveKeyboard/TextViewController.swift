//
//  File.swift
//  responsiveKeyboard
//
//  Created by Jonathan Phouminh on 7/21/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class TextViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        textField.text = "7209369977"
        textField.isEditable = false  // detectable types are only available when the state is not editable 
        textField.isSelectable = true    // lets you select detectable items in the text view
        textField.dataDetectorTypes = .phoneNumber
    }
    
    
}

