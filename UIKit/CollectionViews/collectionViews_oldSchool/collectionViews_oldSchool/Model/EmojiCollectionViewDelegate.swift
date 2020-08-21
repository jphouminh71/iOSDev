//
//  EmojiCollectionViewDelegate.swift
//  collectionViews_oldSchool
//
//  Created by Jonathan Phouminh on 7/14/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

/* this is where we can implement function so that we can adjust attributes such as line spacing between cells */
class EmojiCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout{
    
    weak var viewController: UIViewController!       // using this property, we can manually perform the segue when a cell is tapped
    
    
    //MARK: - CONFIGURING COLLECTION VIEW LAYOUT
    let numberOfItemsPerRow: CGFloat
    let interItemSpacing: CGFloat      // desired spacing between items
    
    init(RowHasThisManyItems count: CGFloat, SpacedThisFarApart spacing: CGFloat) {
        self.numberOfItemsPerRow = count
        self.interItemSpacing = spacing
    }
    
    // this is the function where we customize how the cells will be layed out in the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        // we will query the bounds for the current screen to calculate the sizes of our cells
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let spacingRequired: CGFloat = interItemSpacing * numberOfItemsPerRow
        
        let itemWidth: CGFloat = ((screenWidth) - spacingRequired) / numberOfItemsPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    // spacing between the items in the same colomn
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }
    
    // this defines the spacing for the top of each section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: interItemSpacing/2, right: 0)
        }
        else{
            return UIEdgeInsets(top: interItemSpacing / 2, left: 0, bottom: interItemSpacing / 2, right: 0)
        }
    }
    
    
    
    //MARK: - CELL SELECTION
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        // we want to change the backgroud color of the cell when it is tapped
//
//
//
//
//        guard let viewController = viewController else {return}
//
//        if !viewController.isEditing{
//            viewController.performSegue(withIdentifier: K.cellSegue, sender: self)
//        }
//
//    }
}
