//
//  ViewController.swift
//  NavigationControllers
//
//  Created by Jonathan Phouminh on 7/22/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("transitioning")
        performSegue(withIdentifier: "firstLink", sender: self)
    }

    
    // THIS IS WHERE YOU BECOME A DELEGATE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstLink" {
            let destinationVC = segue.destination as? SecondViewController
            destinationVC?.passedText = "This is the passed text"
            destinationVC?.SecondVCDelegate = self
        }
    }
    
    /* SIDE NOTE ON PASSING BACK INFORMATION */
    /*
        If you want to pass back data, remember that you can create a delegate pattern for the VC's and
        just have some object represent the internals of what is going on in the VC(B) so that VC(A) can access
        anything it needs. 
     */
}

extension ViewController: SecondVCProtocol {
    func passBackInformation(_ SecondVC: SecondViewController, _ text: String) {
        self.textLabel.text = text 
    }
    
    
}

