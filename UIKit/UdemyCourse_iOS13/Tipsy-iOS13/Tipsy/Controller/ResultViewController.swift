//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Jonathan Phouminh on 6/10/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    /* properties that we will get from the mainView that will help us load this view */
    var costPerPerson: String?
    var tip: String?
    var splitCount: String?
    
    
    /* labels we need to set */
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        costLabel.text = "$" + costPerPerson!
        descriptionLabel.text = "Split between \(splitCount!), with \(tip!)% tip."
        
    }
    /* just dismiss the view */
    @IBAction func recalculatePressed(_ sender: Any?) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
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
