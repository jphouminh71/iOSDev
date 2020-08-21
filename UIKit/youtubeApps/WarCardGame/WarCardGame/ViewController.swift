//
//  ViewController.swift
//  WarCardGame
//
//  Created by Jonathan Phouminh on 6/4/20.
//  Copyright © 2020 Phou. All rights reserved.
//

import UIKit

///* this class is inheriting from the UIViewController class
class ViewController: UIViewController {
    ///* IBOutlet means that this is just representing an object in the storyboard
    ///* we have essentially hooked up that object into this variable , so now we can manipulate it
    @IBOutlet weak var leftImageView: UIImageView!
    ///* Right card score
    @IBOutlet weak var rightImageView: UIImageView!
    ///* Player score
    @IBOutlet weak var playerScore: UILabel!
    ///* CPU Score
    @IBOutlet weak var cpuScore: UILabel!

    ///* so we are just extending the viewDidLoad() with more instructions 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func resetScore() -> (){
        self.playerScore.text = "0"
        self.cpuScore.text = "0"
    }
    
    ///* This button is an action button, it is triggered once an event is sent in
    @IBAction func dealTapped(_ sender: Any) {
        print("Deal tapped!")   /* anything thats printed gets sent to the console log. Its like node.js -> console.log("hello world")*/
        
        let leftNumber: Int = Int.random(in: 2...14)
        let rightNumber: Int = Int.random(in: 2...14)
        
        ///* with this UIImage constructor we are able to specify a name that is searched for inside of the asset folder
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        if (leftNumber > rightNumber){
            let v: String = String(self.playerScore.text!)
            let vI: Int? = Int(v)
            self.playerScore.text = "\(vI! + 1)"
            
        }else if (rightNumber > leftNumber){
            let v: String = String(self.cpuScore.text!)
            let vI: Int? = Int(v)
            self.cpuScore.text = "\(vI! + 1)"
        }else{
            
        }
        ///* checking to see who is a winner, we don't have a winning player or cpu image so we will just reset the scores and print the winner in the console.
        
        if (self.cpuScore.text == "10"){
            print("CPU WINS!!!")
            resetScore()
        }else if (self.playerScore.text == "10"){
            print("PLAYER WINS!!!")
            resetScore()
        }
    }
    
    

}

