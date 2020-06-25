//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    ///* normally you would just initialize this all in the ViewDidLoad function so that the coad is a lot cleaner , its kind of like your constructor
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    /* time to cooks eggs accordingly (minutes)*/
    let eggTimes:[String:Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var countdownTimer: Timer!
    var totalTime: Int = 0
    var timeRemaining: Int = 0
   
    /* timer function requires use of objc elements */
    func timer() -> (){
        /* this will just keep calling the updateTime function until .invalidDate() is returned? */
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    @objc func updateTime() -> (){
        if timeRemaining < 1{
            countdownTimer.invalidate()
            finish()
        }else{
            timeRemaining = timeRemaining - 1
            let percentCompleted: Float = Float(timeRemaining) / Float(totalTime)
            progressView.progress = 1.0 - percentCompleted
            
        }
    }
    
    /* resets the ui */
    func finish() -> (){
        progressView.progress = 1  // finishes the progress bar
        mainLabel.text = "done!"
        
        /* need to reset the label */
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
            self.mainLabel.text = "How do you like your eggs?"
        }
    }
    
    /* IBAction for all three buttons */
    @IBAction func buttonPresseed(_ sender: UIButton) {
        let hardnessLevel: String? = sender.titleLabel?.text
        progressView.progress = 0.0
        switch hardnessLevel {
        case "Soft":
            //totalTime = eggTimes[hardnessLevel!]! * 60; timeRemaining = eggTimes[hardnessLevel!]! * 60
            totalTime = 10; timeRemaining = 10
            self.mainLabel.text = "Soft egg coming up!"
            timer()
        case "Medium":
            totalTime = eggTimes[hardnessLevel!]! * 60; timeRemaining = eggTimes[hardnessLevel!]! * 60
            self.mainLabel.text = "Medium egg coming up!"
            timer()
        case "Hard":
            totalTime = eggTimes[hardnessLevel!]! * 60; timeRemaining = eggTimes[hardnessLevel!]! * 60
            self.mainLabel.text = "Hard egg coming up!"
            timer()
        default:
            print("bad input")
        }
    }
}
