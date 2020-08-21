//
//  EmojiCell.swift
//  collectionViews_oldSchool
//
//  Created by Jonathan Phouminh on 7/14/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

/*  This is the backing class for each cell that we have, here all you want to do is link up all the
 connections for your custom cells so that its easier to modify in your ViewController
 */
class EmojiCell: UICollectionViewCell {
    @IBOutlet weak var emojiLabel: UILabel!
    
    var isEditing: Bool = false
    
    /* this is interesting, we can also handle if a cell got tapped here and not in the CVDelegate */
    override var isSelected: Bool{
        didSet {
            if isEditing {
                contentView.backgroundColor = isSelected ? UIColor.systemRed.withAlphaComponent(0.5) : UIColor.systemGroupedBackground
            } else{
                contentView.backgroundColor = UIColor.systemGroupedBackground
            }
        }
    }
}
