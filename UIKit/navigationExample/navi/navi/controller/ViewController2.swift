//
//  ViewController2.swift
//  navi
//
//  Created by Jonathan Phouminh on 7/8/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var stackey: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let navTitle = self.navigationItem.title {
            let title = NSLocalizedString("back_to", comment: "Left nav bar title") + " \(navTitle)"
            let myButton = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
            let myColor:UIColor = .red
            myButton.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: myColor ], for: .normal)
          
            self.navigationItem.backBarButtonItem = myButton
        }
        
        // this is how you update the color of just the back buttons text
        let backButton = UIBarButtonItem(title: "back", style: .plain , target: nil, action: nil)
        backButton.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: UIColor(red: 100, green: 0, blue: 100, alpha: 1)], for: .normal)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        // this is how you update the actual indicator image for the back button
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "pencil")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "pencil")

        
        stackey.alignment = .center
        stackey.distribution = .fillEqually
        stackey.spacing = 10
        stackey.backgroundColor = .gray
        
        let label = UIButton()
        label.titleLabel?.text = "Text1"
        label.backgroundColor = .red
        let label2 = UIButton()
        label2.backgroundColor = .blue
        label2.titleLabel?.text = "Text2"
        stackey.addArrangedSubview(label)
        stackey.addArrangedSubview(label2)
        
    }
    
    
    
}
