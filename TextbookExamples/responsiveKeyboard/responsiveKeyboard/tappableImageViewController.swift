//
//  tappableImageViewController.swift
//  responsiveKeyboard
//
//  Created by Jonathan Phouminh on 7/21/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

class tappableImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImageViewSize()
        configureNavigation()
    }
    
    func configureImageViewSize() {
        // leaving this here just to remind you, just do this through storyboard its a lot easier
        
        imageView.isUserInteractionEnabled = true
    }
    
    // method runs anytime the user taps on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first  // implies that all consequetive touches are queued up in an array
        
        if touch?.view == imageView {
            print("image view touched")
        } else {
            print("you touched something else ")
        }
    }
    
    func configureNavigation() {
        let rightBtn = UIBarButtonItem(title: "textview", style: .plain, target: self, action: #selector(jumpScreen))
        
        navigationItem.rightBarButtonItem = rightBtn
    }
    
    @objc func jumpScreen() {
        performSegue(withIdentifier: K.secondScreen, sender: self)
    }
}
