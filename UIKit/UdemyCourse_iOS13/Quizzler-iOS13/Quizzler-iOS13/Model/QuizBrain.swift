//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Jonathan Phouminh on 6/9/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct QuizBrain{
    var quiz: [Question] = [Question]()
    var questionNumber: Int = 0
    
    
    /* updates the question on the UI */
    mutating func updateQuestion() -> (){
        questionNumber += 1
        questionLabel.text = quiz[questionNumber].text
        
        progressBarView.progress = Float(questionNumber) / Float(quiz.count)
    }
    
    /* updates the background color of the question label */
    func updateColor(_ sender: UIButton, _ ans: Bool) -> (){
        if (ans == false){
            /* change the color to red for wrong answer */
            sender.backgroundColor = UIColor.red
        }else{
            /* change it to green for being correct */
            sender.backgroundColor = UIColor.green
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.revertColor(sender)
        }
    }
    
    /* reverts to the original background color of the question label */
    func revertColor(_ sender: UIButton) -> (){
        sender.backgroundColor = UIColor.clear
    }
    
    mutating func endGame() -> (){
        questionNumber = 0
        questionLabel.text = "Game Over!"
        trueButton.isEnabled = false
        falseButton.isEnabled = false
    }
}
