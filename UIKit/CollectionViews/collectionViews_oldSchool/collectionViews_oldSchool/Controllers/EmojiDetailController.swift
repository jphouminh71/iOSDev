//
//  EmojiDetailController.swift
//  collectionViews_oldSchool
//
//  Created by Jonathan Phouminh on 7/14/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import UIKit

/* PURPOSE:
    This view controller controls detail view where each emoji can be anyalized in detail 
 */
class EmojiDetailController: UIViewController {

    var passedEmojiString: String?
    @IBOutlet weak var emojiTextLabel: UILabel!
    
    
    /// this method needs to be here becasue you cannot set a UILabel in a prepare segue because it hasn't been loaded in yet.
    override func viewWillAppear(_ animated: Bool) {
        emojiTextLabel.text = passedEmojiString!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
