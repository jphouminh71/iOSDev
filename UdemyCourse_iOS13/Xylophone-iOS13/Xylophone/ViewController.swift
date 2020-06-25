//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    /* sender is essentially an object of the uibutton that lets you gain access to all the properities of*/
    @IBAction func buttonPressed(_ sender: UIButton) {
        let senderName: String? = sender.titleLabel?.text
        /* don't know how to preunpack optionals so just unpack it manually */
        setAlpha(sender)
        playSound(senderName!)
    }
    
    /* changing the opaqueness of the uiobject that just got pushed */
    func setAlpha(_ sender: UIButton) -> (){
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    /* function just plays sound */
    func playSound(_ senderName: String) -> (){
        let path = Bundle.main.path(forResource: "\(senderName).wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    

}

