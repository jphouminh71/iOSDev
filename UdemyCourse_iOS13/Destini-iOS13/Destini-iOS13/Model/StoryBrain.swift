//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

///* ANY LOGIC SHOULD BE HANDLED IN HERE 
import Foundation

struct StoryBrain{
private
    var stories: [Story] = [Story(hasStory: "You see a fork in the road", option1: "Take left", option2: "Take right"),
    Story(hasStory: "You see a tiger", option1: "Shout for help.", option2: "Play dead."), Story(hasStory: "You find a treasure chest.", option1: "Open it.", option2: "Check for traps.")]
    var currentQuestion: Int = 0

public
    
    /* returns the story for the currentQuestion */
    func getStory() -> String{
        return stories[currentQuestion].story
    }
    
    /* returns option1 for the currentStory */
    func getOption1() -> String{
        return stories[currentQuestion].choice1
    }
    
    /* returns option2 for the currentStory */
    func getOption2() -> String{
        return stories[currentQuestion].choice2
    }
    
    /* updates the story */
    mutating func nextStory(_ choice: Int) -> (){
        if (choice == 1){
            currentQuestion += 1
        }else{
            currentQuestion += 2
        }
    }
    
    
}
