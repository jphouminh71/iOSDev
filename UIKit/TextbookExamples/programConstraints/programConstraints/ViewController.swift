//
//  ViewController.swift
//  programConstraints
//
//  Created by Jonathan Phouminh on 7/23/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var renderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageView = UIButton()
        imageView.setTitle("Button", for: .normal)
        imageView.backgroundColor = .red
        renderView.addSubview(imageView)
        
        // enabling constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: renderView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: renderView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }


}

