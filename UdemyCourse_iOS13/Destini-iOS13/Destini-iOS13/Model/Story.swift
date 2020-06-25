//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

/* creating a struct for Story objects */

struct Story{
    let story: String
    let choice1: String
    let choice2: String
    
    init(hasStory s: String, option1 v1: String, option2 v2: String) {
        self.story = s
        self.choice1 = v1
        self.choice2 = v2
    }
}
