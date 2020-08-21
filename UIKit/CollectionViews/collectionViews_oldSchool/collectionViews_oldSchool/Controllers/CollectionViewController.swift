//
//  ViewController.swift
//  collectionViews_oldSchool
//
//  Created by Jonathan Phouminh on 7/14/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

/*     STEPS TO FOLLOW
    Since this a flow model, we set the layout of the collection view in the storyboard, im sure you can do this programatically.
    Once you have set up the layout, then you need to set the dataSource and provide snapshots of data

    Configure a separate dataSource object, and then link it up here
        ex ) dataSource = Datasource()
 
    Then let the collection view know what the dataSource is
 */

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // hooking up the delegate and dataSource 
    let dataSourceForCollectionView = Datasource()
    let delegateLayout = EmojiCollectionViewDelegate(RowHasThisManyItems: 6, SpacedThisFarApart: 6)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.allowsMultipleSelection = true 
        
        /// hooking up the datasource for the collectionView
        collectionView.dataSource = dataSourceForCollectionView
        collectionView.delegate = delegateLayout
        collectionView.backgroundColor = .red
        configureNavigation()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        // We are actually updating the UIBarButtonItem here for the current editing state, this might be a bad idea.
        switch editing {
        case true:
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(self.deletebtn))
        case false:
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Emoji", style: .plain, target: self, action: #selector(self.addEmoji))
        default:
            fatalError()
        }
        // special property for visible cells on the screen
        collectionView.indexPathsForVisibleItems.forEach {
            guard let emojiCell = collectionView.cellForItem(at: $0) as? EmojiCell else {return}
            emojiCell.isEditing = editing
        }
        
        if !isEditing {
            collectionView.indexPathsForSelectedItems?.compactMap({ $0 }).forEach {
                collectionView.deselectItem(at: $0, animated: true)
            }
        }
    }
    
    
    /* this method is called before any segway is actually triggered, so you can do things like reject that segue call if we are in edit mode */
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if self.isEditing {
            return false
        }
        return true
    }
    
    /*  preparing the segue for when a user taps on a cell, have to ensure a few things
     1. Ensure the correct segue is being used
     2. Ensure the destination controller is of type <theCustomClass>, cast the DestinationVC
     3. Get the indexpath for the currect cell that we just tapped on
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == K.cellSegue,
            let destinationVC = segue.destination as? EmojiDetailController,
            let selectedEmoji = sender as? EmojiCell,
            let indexPath = collectionView.indexPath(for: selectedEmoji),
            let sentEmoji = Emoji.shared.emoji(at: indexPath)
            else{
            fatalError("Something went wrong transitioning for the emoji")
        }
        
        // now we just set the properties that we want to in the destinationVC
        destinationVC.passedEmojiString = sentEmoji
    }
    
    func configureNavigation() {
        let addBtn: UIBarButtonItem = UIBarButtonItem(title: "Add Emoji", style: .plain, target: self, action: #selector(addEmoji))
            
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = addBtn

        
    }
    
    @objc func deletebtn() {
        /*
            1. gather selected indices
            2. loop through selected indicies and get the cell for that indice and remove it from the data model
            3. Finally, remove the visible data from the collection view
         */
        guard let selectedIndicies = collectionView.indexPathsForSelectedItems else {return}
        dataSourceForCollectionView.deleteEmoji(at: selectedIndicies)
        collectionView.deleteItems(at: selectedIndicies)
        
    }
    
    @objc func addEmoji() {
        let emojiToBeAdded: (Emoji.Category, String) = Emoji.randomEmoji()  // unpack by .1 ...  .<value>
        dataSourceForCollectionView.addEmoji(emojiToBeAdded.1, to: emojiToBeAdded.0)     // adding the emoji data to our model
        
        // going to insert that item directly into an index path  ,   this is better than using .reloadData()
        let emojiCount = collectionView.numberOfItems(inSection: 0)   // hard coded
        let insertedIndex = IndexPath(row: emojiCount, section: 0)
        collectionView.insertItems(at: [insertedIndex])
    }
    
    
}


