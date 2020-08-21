//
//  CardModel.swift
//  MatchingCardGame
//
//  Created by Jonathan Phouminh on 6/5/20.
//  Copyright © 2020 Phou. All rights reserved.
//

import Foundation


class CardModel{
    func getCards() -> [Card]{
        var gernatedCardsArray: [Card] = [Card]()
        var generatedNumbers: [UInt32] = [UInt32]()
        // generate the cards
        for _ in 1...8{
            var randomNumber = arc4random_uniform(13) + 1  // random number form 1 -> 13
            while(generatedNumbers.contains(randomNumber)){
                randomNumber = arc4random_uniform(13) + 1
            }
            generatedNumbers.append(randomNumber)
            
            // generating the first card
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            gernatedCardsArray.append(cardOne)
            
            ///* have to generate two differnet cards because these are reference objects so they will be referencing the same thing if we just appended card one twice
            
            // generating the second card
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            gernatedCardsArray.append(cardTwo)
        }
        
        return gernatedCardsArray
    }
    
}
