//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

///* THIS FILE SHOULD ONLY BE UPDATING THE UIVIEW
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var stories: [Story] = [Story(hasStory: "You see a fork in the road", option1: "Take left", option2: "Take right"),
    Story(hasStory: "You see a tiger", option1: "Shout for help.", option2: "Play dead."), Story(hasStory: "You find a treasure chest.", option1: "Open it.", option2: "Check for traps.")]
    var currentQuestion: Int = 0
    
    var storyBrain: StoryBrain = StoryBrain()


    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    /* EVENT HANDLER */
    /* odd numbers are choice1 and even numbers are choice2 */
    @IBAction func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(sender.tag)
        updateUI()
    }
    
    
    
    func updateUI() -> (){
        storyLabel.text = storyBrain.getStory()
        choice1Button.setTitle(storyBrain.getOption1(), for: .normal)
        choice2Button.setTitle(storyBrain.getOption2(), for: .normal)
    }
    


}

