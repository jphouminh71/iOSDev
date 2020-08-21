//
//  Bill.swift
//  Tipsy
//
//  Created by Jonathan Phouminh on 6/10/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Bill {
    var billAmount: Double?
    var tip: Double?
    var totalAmount: Double{
        get {
            billAmount! + (billAmount! * tip!)
        }
    }
    var costPerPerson: Double{
        get{
            totalAmount / splitCount
        }
    }
    var splitCount: Double = 2.0  // default is set at 2
    
    mutating func increaseSplitCount() -> (){
        self.splitCount += 1
    }
    mutating func decreaseSplitCount() -> (){
        self.splitCount -= 1
    }
}
