//
//  questionStruct.swift
//  Quizzler-iOS13
//
//  Created by Jonathan Phouminh on 6/9/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text: String
    let ans: Bool
    
    init(_ qq: String, _ ans: Bool) {
        self.text = qq
        self.ans = ans
    }
}
