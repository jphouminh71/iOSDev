//
//  ViewController.swift
//  Bullseye Game
//
//  Created by Jonathan Phouminh on 6/30/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

//MARK: -- NOTES
/*
    some things you can fix in the future
        create a better representation for what the user can see if they did well or not
        make the background music loop, right now it just plays through once until you reset the game
 */



import UIKit
import AVFoundation

///* Remember, the only thing that the ViewControllers should ever be doing is updating the UI. Nothing with logic should happen here. 
class ViewController: UIViewController {
    
    // MARK: -- IBOutlets
    @IBOutlet weak var targetValue: UILabel!
    @IBOutlet weak var mySlider: customizedSlider!
    @IBOutlet weak var userScore: UILabel!
    
    private var TargetValue: Float = 0.0
    private var playing: Bool = false
    private var slidingDirection: String = K.right
    private var bullseyeBrain = BullsEyeBrain()
    
    private var myTimer: Timer!
    private var buttonPlayer: AVAudioPlayer?
    private var backgroundMusicPlayer: AVAudioPlayer?
    private var celebrationPlayer: AVAudioPlayer?


    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundMusic()
        resetGame()
        
    }

    // MARK: -- Action Outlets
    @IBAction func hitPressed(_ sender: UIButton) {
        playButtonSound()
        if (playing){
            stopGame()
        }
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        if (!playing){
            resetGame()
        }
    }
    
    
   
}


//MARK: -- SOUNDS
// in the future take out all the separate audioplayers and  just have one
extension ViewController {
    
   func playButtonSound() -> (){
    let path = Bundle.main.path(forResource: K.buttonSoundFile, ofType:nil)!
       let url = URL(fileURLWithPath: path)
       do {
           buttonPlayer = try AVAudioPlayer(contentsOf: url)
           buttonPlayer?.play()
       } catch {
           // couldn't load file :(
       }
   }
    
        
    func playBackgroundMusic() -> (){
        let path = Bundle.main.path(forResource: K.backgroundSoundFile, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            buttonPlayer = try AVAudioPlayer(contentsOf: url)
            buttonPlayer?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    func playCelebrationMusic() -> (){
        let path = Bundle.main.path(forResource: K.partyEffect, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            buttonPlayer = try AVAudioPlayer(contentsOf: url)
            buttonPlayer?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    
}

//MARK: -- UPDATE UI
extension ViewController {
    
    func BeginGame() -> (){
        // begin sliding
        myTimer = Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true) { (timer) in
            if (self.mySlider.value == K.maximumSliderValue){
                self.slidingDirection = K.left
            }
            if (self.mySlider.value == K.minimumSliderValue){
                self.slidingDirection = K.right
            }
            
            switch self.slidingDirection {
                case K.right:
                    self.mySlider.value = self.mySlider.value + 1
                case K.left:
                    self.mySlider.value = self.mySlider.value - 1
                default:
                    print("something went wrong")
            }
        }
    }
    
    
    // resets the UI
    func resetGame() -> (){
        playing = true
        TargetValue = bullseyeBrain.generateTargetValue()
        targetValue.text = String(Int(TargetValue))
        mySlider.value = 50
        userScore.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        playBackgroundMusic()
        BeginGame()
    }
    
    
    // calculates the offset then updates the UI
    func stopGame() -> (){
        playing = false
        myTimer.invalidate()
        
        let difference = bullseyeBrain.calculateDistance(TargetValue, mySlider.value)
        
        if (difference <= 10){
            userScore.textColor = #colorLiteral(red: 0.2053787708, green: 0.7345196605, blue: 0.08598629385, alpha: 1)
        }
        if (difference <= 5){
            playCelebrationMusic()
            userScore.textColor = #colorLiteral(red: 0.9850263, green: 0.8516306877, blue: 0.01439985447, alpha: 1)
        }
        
        userScore.text = String(difference)
    }
}


