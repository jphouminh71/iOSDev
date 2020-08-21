//
//  ViewController.swift
//  collectionView
//
//  Created by Jonathan Phouminh on 7/13/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

//MARK: - IMPORTANT!! This method of implementation is only supported on iOS 13+ so you won't be doing it this way 
import UIKit

class ViewController: UIViewController {
    enum Section {
        case main
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // we have essentially declared our dataSource to be an instance of a diffable data source that has the types: Section and Int
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.collectionViewLayout = configureLayout()
        configureDataSource()
    }

    
    // configuring the layout
    func configureLayout() -> UICollectionViewCompositionalLayout {
        
        
        /// here we just created a section > group > itemn
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))   // we declared the size of an item that we want
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)  // giving our collection view content insets
        
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])  // loading the items into the group
        let section = NSCollectionLayoutSection(group: group)   // sections are sized relative to actual collection view
        
        
        
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func configureDataSource() {
        /*
         1. first arguement is the collection view to which collection view to work with
         2. second arguement is closure describing how the data is mapped to each cell
             This function is very similar to how cellForRow  function in table views. This is how we set up the metadata to the collection view item.
         
              All we have done here is instruct the dataSource to construct a UICOllectionViewCell given a single piece of data (number)
         */
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: self.collectionView){
            (collectionView, indexPath, number) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "numberCell", for: indexPath) as? NumberCell else{
                fatalError("cannot create new cell")
            }
            /// styling the cell
            cell.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            cell.label.text = number.description
            return cell
        }
        
        // now we need to provide the dataSoure a "Snapshot of data"
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        initialSnapshot.appendSections([.main])
        initialSnapshot.appendItems(Array(1...100)  , toSection: .main)
        
        // applying that initial snapshot to the collection view
        // it iterates over the collection view and passes each value of the snapshot to the closure
        dataSource.apply(initialSnapshot, animatingDifferences: true)
    }
    


}

