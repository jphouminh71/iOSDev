//
//  Datasource.swift
//  collectionViews_oldSchool
//
//  Created by Jonathan Phouminh on 7/14/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

// have to inherit NSObject, because collection views expect their data source items to conform to NSObject
class Datasource: NSObject, UICollectionViewDataSource {
    
    
    //MARK: - Setting up the actual cell
    let emojis: Emoji = Emoji.shared       // this is our reference to the singleton array of emojis in the Emoji.swift file
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return emojis.sections.count
    }
    
    
    // this gets called for each section number that exists, so in this case however many categories there are in the categories
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let currentCategory = emojis.sections[section]
        return emojis.data[currentCategory]!.count
    }
    
    // we are telling the datasource how to load the data into the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // create the emoji cell then cast it into a usable form so we can get into the label
        if let emojiCell = collectionView .dequeueReusableCell(withReuseIdentifier: K.cellReuseIdentifier, for: indexPath) as? EmojiCell{
            
            // loading the emoji into the cell label
            let categoryKey: Emoji.Category = emojis.sections[indexPath.section]
            let dataCategory: [String] = emojis.data[categoryKey]!
            let wantedEmoji = dataCategory[indexPath.row]
            emojiCell.emojiLabel.text = wantedEmoji
            emojiCell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
            return emojiCell
        }
        else{
            fatalError("Emoji cell could not be created")   // use these to immediately kill programs
        }
    }
    
    //MARK: -Setting up header view
    // 2 parameters, kind of supplementary view (header or footer), and indexPath for the current section
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        // creating supplementary header view
        if let emojiHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: K.headerReuseIdentifier, for: indexPath) as? EmojiHeaderView{
            emojiHeaderView.headerTextLabel.text = emojis.sections[indexPath.section].rawValue
                return emojiHeaderView
        }
        fatalError("Couldn't create header view.")

    }
}

//MARK: - UDPATE DATA SOURCE
// these are the functions that are actually going in and removing the data from the backend, instead of arrays here you would probably have database queries / requests
extension Datasource {
    func addEmoji(_ emoji: String, to category: Emoji.Category) {
        guard var emojiData = self.emojis.data[category] else {return}
        emojiData.append(emoji)
        
        // updating the datasource , this .updateValue is a dictionary method
        self.emojis.data.updateValue(emojiData, forKey: category)
    }
    
    func deleteEmoji(at indexPath: IndexPath){
        let category = emojis.sections[indexPath.section]
        guard var emojiData = emojis.data[category] else {return}
        emojiData.remove(at: indexPath.item)
        
        emojis.data.updateValue(emojiData, forKey: category)     // have to udate the dictionary manually since it is a value type.
    }
    
    func deleteEmoji(at indexPaths: [IndexPath]){
        for item in indexPaths {
            deleteEmoji(at: item)
        }
    }
}
