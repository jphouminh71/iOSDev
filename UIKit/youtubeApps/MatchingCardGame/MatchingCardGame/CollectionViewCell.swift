//
//  CollectionViewCell.swift
//  MatchingCardGame
//
//  Created by Jonathan Phouminh on 6/5/20.
//  Copyright © 2020 Phou. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!

    var card: Card?
    
    func setCard(_ card: Card){
        
        // keep track of the card that gets passed in
        self.card = card
        
        if (card.isMatched == true){
            // if the card has been matched, thne amke the image views invisible
            backImageView.alpha = 0
            frontImageView.alpha = 0
            
            return
        }else{
            
            // if the card hasn't been matched then make them visible
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
        frontImageView.image = UIImage(named: card.imageName)
        
        // determine if the card is in a flipped up state or flipped down state
        if (card.isFlipped){
            // make sure the front image view is on top
            UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            
        }else{
            // make sure the back image view is on top
            UIView.transition(from: frontImageView, to: backImageView, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
    }
    
    func flip(){
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipBack(){
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        })
        
       
    }
    
    func remove(){
        //removes both imageview from being invisible
        backImageView.alpha = 0
        
        // Animate it
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {self.frontImageView.alpha = 0}, completion: nil)
        
        
    }
}
