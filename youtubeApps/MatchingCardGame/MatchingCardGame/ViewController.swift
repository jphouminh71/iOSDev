//
//  ViewController.swift
//  MatchingCardGame
//
//  Created by Jonathan Phouminh on 6/5/20.
//  Copyright © 2020 Phou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var model = CardModel()  // returns us an array of cards
    var cardArray: [Card] = [Card]()
    
    var firstFlippedCardIndex: IndexPath? = nil
    var secondFlippedCardIndex: IndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        
        cardArray = model.getCards()
        
    }

    // MARK: - UICollectionView Protocol Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a CollectionViewObject
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CollectionViewCell
        
        // Get the card that the collection view is trying to display
        let card = cardArray[indexPath.row]
        
        
        // set that card for the cell
        cell.setCard(card)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // get the cell that the user selected
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
        // get the card that the user selected
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false{
            card.isFlipped = true
            cell.flip()
            
            // determine if it is the first card or second card that is flipped over
            
            if (firstFlippedCardIndex == nil){
                firstFlippedCardIndex = indexPath
            }else{
                // this must be the second card being flipped
                checkForMatches(indexPath)
            }
        }

    } // End the didSelectItemAt method
    
    // MARK: - Game logic methods
    
    func checkForMatches(_ secondFlippedCardIndex: IndexPath?){
        
        // get the cells for the two cards revealed
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CollectionViewCell
        
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex!) as? CollectionViewCell
        
        // get the cards for the two cards that were revealed
        
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex!.row]
        
        
        // compare the two cards
        if (cardOne.imageName == cardTwo.imageName && cardOne.isMatched == false){
            // its a match
            
            // set the status' of the cards
            cardOne.isMatched = true
            cardTwo.isMatched = true
            // remove the cards from the grid
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
            
        }else{
            // it is not a match
            // set the statuses of the two cards
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            // flip the cards back over
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
        }
        
        self.firstFlippedCardIndex = nil
        self.secondFlippedCardIndex = nil
        
        
    }

} // End ViewControllerClass

