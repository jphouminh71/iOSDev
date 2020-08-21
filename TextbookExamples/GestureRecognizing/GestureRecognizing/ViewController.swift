//
//  ViewController.swift
//  GestureRecognizing
//
//  Created by Jonathan Phouminh on 7/21/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // creating a pinch gesture recoginzer that we will use scale pencil image
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        let holdGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleHold))
        imageView.addGestureRecognizer(pinchGesture)
        imageView.addGestureRecognizer(tapGesture)
        imageView.addGestureRecognizer(holdGesture)
    }

    override func viewWillAppear(_ animated: Bool) {
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .red
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer){
        performSegue(withIdentifier: "first", sender: self)
    }
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer){
        
        // if you wanted to make sure this didn't scale past a certain bound, then what you could do is just add something to check the current dimensions
        imageView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    
    @objc func handleHold(_ sender: UILongPressGestureRecognizer){
        performSegue(withIdentifier: "picker", sender: self)
    }

}

