//
//  Buttons-Switches-SegementedControlsViewController.swift
//  responsiveKeyboard
//
//  Created by Jonathan Phouminh on 7/21/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class Buttons_Switches_SegementedControlsViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.insertSegment(with: UIImage(systemName: "pencil"), at: 2, animated: true)
        print("view loaded")
    }
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        sender.setTitle("hello", forSegmentAt: 0)    // use the 'set' properties to change things
    }
    


}
