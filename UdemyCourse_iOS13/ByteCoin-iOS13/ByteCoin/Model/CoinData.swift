//
//  CoinData.swift
//  ByteCoin
//
//  Created by Jonathan Phouminh on 6/19/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

/*
    we created this struct so that we are able to parse the incoming JSON data, we will be using this to create
 another object CoinModel so that we can use that for UIUpdating 
 */
/*  only want to includ eth following information
 
 "asset_id_base": "BTC",
 "asset_id_quote": "USD",
 "rate": 9338.477451938938789143770386
 
 */

struct CoinData: Decodable{
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double 
}
