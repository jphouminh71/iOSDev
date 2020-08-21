//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /* setting up the IBOutlets */
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBarView: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
//    var quiz: [Question] = [Question]()
//    var questionNumber: Int = 0
    
    // Setting up the program
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let brain = QuizBrain()
        quiz.append(Question("Four + Two is equal to Six.", true))
        quiz.append(Question("Five + Three is greater than one", true))
        quiz.append(Question("Three + Eight is less than 10",false))
        questionLabel.text = quiz[0].text
        progressBarView.progress = 0.0
    }
    
    
    /* event handler */
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text
        let actualAnswer = quiz[questionNumber].ans
        
        /* determining correct answers */
        switch userAnswer! {
        case "True":
            if (actualAnswer == true){
                print("Correct!")
                updateColor(sender , true)
            }else{
                print("Incorrect.")
                updateColor(sender, false)
            }
        case "False":
            if (actualAnswer == false){
                updateColor(sender, true)
            }else{
                updateColor(sender, false)
            }
        default:
            print("you gave me some bullshit: \(userAnswer!)")
        }
        if (questionNumber < quiz.count-1){
            updateQuestion()
        }else{
            progressBarView.progress = 1.0
            endGame()
        }
    }
    
//    /* updates the question on the UI */
//    func updateQuestion() -> (){
//        questionNumber += 1
//        questionLabel.text = quiz[questionNumber].text
//        
//        progressBarView.progress = Float(questionNumber) / Float(quiz.count)
//    }
//    
//    /* updates the background color of the question label */
//    func updateColor(_ sender: UIButton, _ ans: Bool) -> (){
//        if (ans == false){
//            /* change the color to red for wrong answer */
//            sender.backgroundColor = UIColor.red
//        }else{
//            /* change it to green for being correct */
//            sender.backgroundColor = UIColor.green
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            self.revertColor(sender)
//        }
//    }
//    
//    /* reverts to the original background color of the question label */
//    func revertColor(_ sender: UIButton) -> (){
//        sender.backgroundColor = UIColor.clear
//    }
//    
//    func endGame() -> (){
//        questionNumber = 0
//        questionLabel.text = "Game Over!"
//        trueButton.isEnabled = false
//        falseButton.isEnabled = false
//    }
}

