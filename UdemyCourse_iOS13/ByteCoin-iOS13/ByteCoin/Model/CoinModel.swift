//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Jonathan Phouminh on 6/19/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

/* this is where we take the encoded data in the CoinData struct and create this object for updating the UI */
struct CoinModel{
    let asset_ed_base: String
    let asset_id_quote: String
    let rate: Double
    
    func getRate() -> String{
        return String(format: "%.2f", self.rate)
    }
    
}
